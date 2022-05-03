import 'dart:collection';

import 'package:async_task/async_task.dart';
import 'package:ime_mongol_package/algorithm/burhard_keller_tree.dart';
import 'package:ime_mongol_package/bk_tree_matcher.dart';
import 'package:ime_mongol_package/bk_tree_matcher_main.dart';
import 'package:ime_mongol_package/data/db_provider.dart';
import 'package:ime_mongol_package/data/mongol_words_repository.dart';
import 'package:ime_mongol_package/filter/key_filter.dart';
import 'package:ime_mongol_package/filter/key_filter_factory.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/model/suggest_word.dart';
import 'package:ime_mongol_package/model/word_entity.dart';

import 'keyboard/decomposer.dart';
import 'letter/splice/letter_splicer.dart';

class InputMethodService {
  static const String ROOT_STRING = "ᡥᡪᡱᡪᢝᡥᡪᡱᡪᢝ";
  static const int FREQUENCY_BOUND = 6;

  final _lengthKeyBkMap = Map<int, BurkhardKellerTree>();

  final wordRepository = MongolWordsRepository();

  final decomposer = Decomposer();

  final letterSplicer = LetterSplicer();

  final KeyFilterFactory keyFilterFactory = KeyFilterFactory();

  // final _blackSequenceService = BlackSequenceService();

  Future<void> initialize() async {
    int time1 = DateTime.now().millisecondsSinceEpoch;

    await DbProvider.instance.initialize();
    await _loadWordsAndBuildTree();

    int time2 = DateTime.now().millisecondsSinceEpoch;
    print('initialized autocomplete service in ${time2 - time1} ms');
  }

  Future<void> _loadWordsAndBuildTree() async {
    int maxWordLength =
        await wordRepository.queryMaxLengthByFrequency(FREQUENCY_BOUND - 1);

    int totalRecords = 0;

    for (int wordLength = 1; wordLength <= maxWordLength; wordLength++) {
      final bkTree = BurkhardKellerTree(
        WordEntity.fromString(ROOT_STRING),
      );

      _lengthKeyBkMap[wordLength] = bkTree;

      List<WordEntity> wordEntities =
          await wordRepository.queryWordsByLengthAndGtFrequency(
        length: wordLength,
        frequency: 45,
      );

      totalRecords += wordEntities.length;
      bkTree.addAll(wordEntities);
    }

    print('Total Records loaded: $totalRecords');
  }

  Future<List<SuggestWord>> fuzzyMakeWord(
    final String inputLatinSequence,
  ) async {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    if (inputLatinSequence.isEmpty) {
      return List.empty();
    }

    List<List<String>> decomposedLatinSequences =
        decomposer.decompose(inputLatinSequence);

    if (decomposedLatinSequences.isEmpty) {
      return List.empty();
    }

    var suggestWordMap = HashMap<String, SuggestWord>();

    // Original Java code uses synchronization
    // If performance is slow, try to improve this part

    int time3 = DateTime.now().millisecondsSinceEpoch;

    for (List<String> latinSequence in decomposedLatinSequences) {
      List<LetterShapeSequence> letterShapeSequenceList =
          letterSplicer.fuzzy(latinSequence);

      if (letterShapeSequenceList.isEmpty) {
        continue;
      }

      KeyFilter? keyFilter = keyFilterFactory.get(latinSequence.last + "-tail");

      for (LetterShapeSequence ls in letterShapeSequenceList) {
        String s = ls.toString();

        // if (_blackSequenceService.contains(s)) {
        //   continue;
        // }

        {
          Iterable<SuggestWord> partSuggestWord =
              matchInBkMaps(_lengthKeyBkMap, s);
          // final s = t.word;
          // final keyFilter = keyFilter;
          // if (partSuggestWord.isEmpty) {
          //   _blackSequenceService.add(s);
          // }
          for (SuggestWord sw in partSuggestWord) {
            SuggestWord? tmp = suggestWordMap[sw.str];
            if (tmp != null && tmp.score > sw.score) {
              continue;
            }
            if (keyFilter == null || keyFilter.accept(sw.str)) {
              suggestWordMap[sw.str] = sw;
            }
          }
        }
      }
    }

    int time4 = DateTime.now().millisecondsSinceEpoch;
    print('total execution time for future: ${time4 - time3}');

    //TODO: do it periodically when app is idle
    // _blackSequenceService.persistNewRecords();
    List<SuggestWord> suggestWordList = List.from(suggestWordMap.values);
    suggestWordList.sort((o1, o2) => o2.score.compareTo(o1.score));
    int time2 = DateTime.now().millisecondsSinceEpoch;
    print(
        "fuzzyMakeWord() key: $inputLatinSequence,run time:${time2 - time1}ms");
    return suggestWordList;
  }

  List<String> severeMakeWord(final String inputLatinSequence) {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    if (inputLatinSequence.isEmpty) {
      return List.empty();
    }

    List<List<String>> decomposedLatinSequences =
        decomposer.decompose(inputLatinSequence);

    if (decomposedLatinSequences.isEmpty) {
      return List.empty();
    }

    List<String> words = [];
    for (List<String> latinSequence in decomposedLatinSequences) {
      List<LetterShapeSequence> letterShapeSequenceList =
          letterSplicer.severe(latinSequence);
      if (letterShapeSequenceList.isEmpty) {
        continue;
      }
      for (LetterShapeSequence lss in letterShapeSequenceList) {
        words.add(lss.toString());
      }
    }

    int time2 = DateTime.now().millisecondsSinceEpoch;
    print(
        'severeMakeWord() key: $inputLatinSequence, runtime: ${time2 - time1}');
    return words;
  }

  Future<List<String>> makeWord(final String inputLatinSequence) async {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    if (inputLatinSequence.isEmpty) {
      return List.empty();
    }
    List<String> words = [];
    List<String> severeMatchResult = this.severeMakeWord(inputLatinSequence);
    List<SuggestWord> fuzzyMatchSuggestResult =
        await this.fuzzyMakeWord(inputLatinSequence);

    int timeConvert = DateTime.now().millisecondsSinceEpoch;
    List<String> fuzzyMatchResult =
        SuggestWord.convert(fuzzyMatchSuggestResult);

    print(
        'Conversion time: ${DateTime.now().millisecondsSinceEpoch - timeConvert}');

    if (fuzzyMatchResult.isEmpty) {
      words.addAll(severeMatchResult);
    } else {
      if (severeMatchResult.isEmpty) {
        words.addAll(fuzzyMatchResult);
      } else {
        for (String severe in severeMatchResult) {
          if (fuzzyMatchResult.contains(severe)) {
            words.add(severe);
            fuzzyMatchResult.remove(severe);
          }
        }
        if (words.isEmpty) {
          words.addAll(fuzzyMatchResult);
          words.addAll(severeMatchResult);
        } else {
          words.addAll(fuzzyMatchResult);
        }
      }
    }

    int time2 = DateTime.now().millisecondsSinceEpoch;
    print('makeWord() key: $inputLatinSequence, runtime: ${time2 - time1}ms');
    return words;
  }
}

// This top-level function returns the tasks types that will be registered
// for execution. Task instances are returned, but won't be executed and
// will be used only to identify the task type:
List<AsyncTask> _taskTypeRegister() => [
      BKTreeMatcher(
          "",
          SharedData<Map<int, BurkhardKellerTree>,
              Map<int, BurkhardKellerTree>>({}))
    ];
