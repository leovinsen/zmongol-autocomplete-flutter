
// class MongolAutocompleteService {
  
//     static const  String ROOT_STRING = "ᡥᡪᡱᡪᢝ";
//     static const  int DEFAULT_CAPACITY = 64;
//     static const  int FREQUENCY_BOUND = 6;


//     WordRepository wordRepository;

//     private final Map<Integer, BurkhardKellerTree> lengthKeyBkMap = new HashMap<>(DEFAULT_CAPACITY);

//     private final Decomposer decomposer = new Decomposer();

//     private final LetterSplicer letterSplicer = new LetterSplicer();

//     @Resource
//     private KeyFilterFactory keyFilterFactory;

//     @Resource
//     private MatchPool matchPool;

//     @Resource
//     private BlackSequenceService blackSequenceService;
// }

//   List<String> makeWord(final String inputLatinSequence) {
//         if(inputLatinSequence.isEmpty) {
//           return [];
//         }
//         int time1 = DateTime.now().millisecondsSinceEpoch;
//         List<String> words = new ArrayList<>();
//         List<String> severeMatchResult = this.severeMakeWord(inputLatinSequence).getObj();
//         List<SuggestWord> fuzzyMatchSuggestResult = this.fuzzyMakeWord(inputLatinSequence).getObj();
//         List<String> fuzzyMatchResult = SuggestWord.convert(fuzzyMatchSuggestResult);

//         if (CollectionUtils.isEmpty(fuzzyMatchResult)) {
//             words.addAll(severeMatchResult);
//         } else {
//             if (CollectionUtils.isEmpty(severeMatchResult)) {
//                 words.addAll(fuzzyMatchResult);
//             } else {
//                 for (String severe : severeMatchResult) {
//                     if (fuzzyMatchResult.contains(severe)) {
//                         words.add(severe);
//                         fuzzyMatchResult.remove(severe);
//                     }
//                 }
//                 if (CollectionUtils.isEmpty(words)) {
//                     words.addAll(fuzzyMatchResult);
//                     words.addAll(severeMatchResult);
//                 } else {
//                     words.addAll(fuzzyMatchResult);
//                 }
//             }
//         }

//         int time2 = Instant.now().toEpochMilli();
//         logger.info("key:{},run time:{}ms", inputLatinSequence, time2 - time1);
//         return new MatchResult<>(time2 - time1, words);
//     }