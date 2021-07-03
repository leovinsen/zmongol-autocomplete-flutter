  class InputMethodService implements ApplicationRunner {
    private static final transient Logger logger = LoggerFactory.getLogger(InputMethodService.class);

    private static final transient String ROOT_STRING = "ᡥᡪᡱᡪᢝ";
    private static final transient int DEFAULT_CAPACITY = 64;
    private static final transient int FREQUENCY_BOUND = 6;

    @Resource
    WordRepository wordRepository;

    private final Map<Integer, BurkhardKellerTree> lengthKeyBkMap = new HashMap<>(DEFAULT_CAPACITY);

    private final Decomposer decomposer = new Decomposer();

    private final LetterSplicer letterSplicer = new LetterSplicer();

    @Resource
    private KeyFilterFactory keyFilterFactory;

    @Resource
    private MatchPool matchPool;

    @Resource
    private BlackSequenceService blackSequenceService;

    @Override
      void run(ApplicationArguments args) throws Exception {
        int maxLength = wordRepository.queryMaxLength(FREQUENCY_BOUND - 1);

        while (maxLength > 0) {
            BurkhardKellerTree bkTree = lengthKeyBkMap.get(maxLength);
            if (bkTree == null) {
                bkTree = new BurkhardKellerTree(new WordEntity(ROOT_STRING));
                lengthKeyBkMap.put(maxLength, bkTree);
            }
            BurkhardKellerTree bk = bkTree;
            int curLength = maxLength;
            BatchExecutor.queryAll((pageNum, pageSize) -> {
                List<WordEntity> wordEntityList = wordRepository.queryAll(curLength, 45, pageNum, pageSize);
                if (CollectionUtils.isEmpty(wordEntityList)) {
                    return 0;
                }
                bk.addAll(wordEntityList);
                return wordEntityList.size();
            });
            maxLength--;
        }
    }

      List<SuggestWord> matchInBkMaps(final String str) {
        long time1 = Instant.now().toEpochMilli();
        if (Strings.isBlank(str)) {
            return Collections.emptyList();
        }
        int length = str.length();
        ScoreMarker scoreMarker = new ScoreMarker(str);

        for (Integer keyLength : lengthKeyBkMap.keySet()) {
            if (keyLength >= length && keyLength < length * 2) {
                List<StringDistanceInfo> partMatched =
                        lengthKeyBkMap.get(keyLength).matching(str, keyLength - length);
                if (CollectionUtils.isEmpty(partMatched)) {
                    continue;
                }
                for (StringDistanceInfo info : partMatched) {
                    WordEntity we = (WordEntity) info.getMountObject();
                    scoreMarker.setMaxFrequency(we.getFrequency());
                    SuggestWord sw = new SuggestWord(we.getStr(), we.getLength(),
                            we.getFrequency(), info.getDistance());
                    scoreMarker.add(sw);
                }
            }
        }

        scoreMarker.markAndFilter();
        logger.info("{},{},{}ms", str, scoreMarker.getSuggestWordList().size(), Instant.now().toEpochMilli() - time1);
        return scoreMarker.getSuggestWordList();
    }

      MatchResult<List<SuggestWord>> fuzzyMakeWord(final String inputLatinSequence) {
        long time1 = Instant.now().toEpochMilli();
        if (Strings.isBlank(inputLatinSequence)) {
            return new MatchResult<>(Instant.now().toEpochMilli() - time1, Collections.emptyList());
        }

        List<List<String>> decomposedLatinSequences = decomposer.decompose(inputLatinSequence);
        if (CollectionUtils.isEmpty(decomposedLatinSequences)) {
            return new MatchResult<>(Instant.now().toEpochMilli() - time1, Collections.emptyList());
        }

        Map<String, SuggestWord> suggestWordMap = new HashMap<>(256);
        List<Callable<Void>> tasks = new ArrayList<>();
        for (List<String> latinSequence : decomposedLatinSequences) {
            List<LetterShapeSequence> letterShapeSequenceList = letterSplicer.fuzzy(latinSequence);
            if (letterShapeSequenceList == null || letterShapeSequenceList.isEmpty()) {
                continue;
            }
            KeyFilter keyFilter = keyFilterFactory.get(latinSequence.get(latinSequence.size() - 1) + "-tail");
            for (LetterShapeSequence ls : letterShapeSequenceList) {
                String s = ls.toString();
                if (blackSequenceService.contains(s)) {
                    continue;
                }
                tasks.add(() -> {
                    List<SuggestWord> partSuggestWord = this.matchInBkMaps(s);
                    if (CollectionUtils.isEmpty(partSuggestWord)) {
                        blackSequenceService.add(s);
                        return null;
                    }
                    synchronized (suggestWordMap) {
                        for (SuggestWord sw : partSuggestWord) {
                            SuggestWord tmp = suggestWordMap.get(sw.getStr());
                            if (tmp != null && tmp.getScore() > sw.getScore()) {
                                continue;
                            }
                            if (keyFilter == null || keyFilter.accept(sw.getStr())) {
                                suggestWordMap.put(sw.getStr(), sw);
                            }
                        }
                    }
                    return null;
                });
            }
        }
        matchPool.execute(tasks);

        List<SuggestWord> suggestWordList = new ArrayList<>(suggestWordMap.values());
        suggestWordList.sort((o1, o2) -> Float.compare(o2.getScore(), o1.getScore()));
        long time2 = Instant.now().toEpochMilli();
        logger.info("key:{},run time:{}ms", inputLatinSequence, time2 - time1);
        return new MatchResult<>(time2 - time1, suggestWordList);
    }

      MatchResult<List<String>> severeMakeWord(final String inputLatinSequence) {
        long time1 = Instant.now().toEpochMilli();
        if (Strings.isBlank(inputLatinSequence)) {
            return new MatchResult<>(Instant.now().toEpochMilli() - time1, Collections.emptyList());
        }

        List<List<String>> decomposedLatinSequences = decomposer.decompose(inputLatinSequence);
        if (CollectionUtils.isEmpty(decomposedLatinSequences)) {
            return new MatchResult<>(Instant.now().toEpochMilli() - time1, Collections.emptyList());
        }

        List<String> words = new ArrayList<>();
        for (List<String> latinSequence : decomposedLatinSequences) {
            List<LetterShapeSequence> letterShapeSequenceList = letterSplicer.severe(latinSequence);
            if (letterShapeSequenceList == null || letterShapeSequenceList.isEmpty()) {
                continue;
            }
            for (LetterShapeSequence lss : letterShapeSequenceList) {
                words.add(lss.toString());
            }
        }

        long time2 = Instant.now().toEpochMilli();
        return new MatchResult<>(time2 - time1, words);
    }

      MatchResult<List<String>> makeWord(final String inputLatinSequence) {
        long time1 = Instant.now().toEpochMilli();
        if (Strings.isBlank(inputLatinSequence)) {
            return new MatchResult<>(Instant.now().toEpochMilli() - time1, Collections.emptyList());
        }
        List<String> words = new ArrayList<>();
        List<String> severeMatchResult = this.severeMakeWord(inputLatinSequence).getObj();
        List<SuggestWord> fuzzyMatchSuggestResult = this.fuzzyMakeWord(inputLatinSequence).getObj();
        List<String> fuzzyMatchResult = SuggestWord.convert(fuzzyMatchSuggestResult);

        if (CollectionUtils.isEmpty(fuzzyMatchResult)) {
            words.addAll(severeMatchResult);
        } else {
            if (CollectionUtils.isEmpty(severeMatchResult)) {
                words.addAll(fuzzyMatchResult);
            } else {
                for (String severe : severeMatchResult) {
                    if (fuzzyMatchResult.contains(severe)) {
                        words.add(severe);
                        fuzzyMatchResult.remove(severe);
                    }
                }
                if (CollectionUtils.isEmpty(words)) {
                    words.addAll(fuzzyMatchResult);
                    words.addAll(severeMatchResult);
                } else {
                    words.addAll(fuzzyMatchResult);
                }
            }
        }

        long time2 = Instant.now().toEpochMilli();
        logger.info("key:{},run time:{}ms", inputLatinSequence, time2 - time1);
        return new MatchResult<>(time2 - time1, words);
    }
}
