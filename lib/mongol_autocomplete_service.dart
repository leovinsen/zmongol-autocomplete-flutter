import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:ime_mongol_package/algorithm/burhard_keller_tree.dart';
import 'package:ime_mongol_package/algorithm/score_marker.dart';
import 'package:ime_mongol_package/black_sequence_service.dart';
import 'package:ime_mongol_package/data/db_provider.dart';
import 'package:ime_mongol_package/data/mongol_words_repository.dart';
import 'package:ime_mongol_package/filter/key_filter.dart';
import 'package:ime_mongol_package/filter/key_filter_factory.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/model/string_distance_info.dart';
import 'package:ime_mongol_package/model/suggest_word.dart';
import 'package:ime_mongol_package/model/word_entity.dart';

import 'keyboard/decomposer.dart';
import 'letter/splice/letter_splicer.dart';

List<SuggestWord> matchInBkMaps(Map<String, dynamic> args) {
  var str = args['str'];
  Map<int, BurkhardKellerTree> bkTree = args['bkTree'];

  int length = str.length;
  ScoreMarker scoreMarker = new ScoreMarker(str);

  for (int keyLength in bkTree.keys) {
    if (keyLength >= length && keyLength < length * 2) {
      List<StringDistanceInfo> partMatched =
          bkTree[keyLength]!.matching(str, keyLength - length);
      if (partMatched == null || partMatched.isEmpty) {
        continue;
      }
      for (StringDistanceInfo info in partMatched) {
        WordEntity we = info.getMountObject() as WordEntity;
        scoreMarker.setMaxFrequency(we.frequency);
        SuggestWord sw = new SuggestWord(
            we.str, we.length, we.frequency, info.getDistance());
        scoreMarker.add(sw);
      }
    }
  }

  scoreMarker.markAndFilter();
  return scoreMarker.getSuggestWordList();
}

class InputMethodService {
  static const String ROOT_STRING = "ᡥᡪᡱᡪᢝᡥᡪᡱᡪᢝ";
  static const int DEFAULT_CAPACITY = 64;
  static const int FREQUENCY_BOUND = 6;

  final _lengthKeyBkMap = Map<int, BurkhardKellerTree>();

  final wordRepository = MongolWordsRepository();

  final decomposer = new Decomposer();

  final letterSplicer = new LetterSplicer();

  final KeyFilterFactory keyFilterFactory = new KeyFilterFactory();

  final _blackSequenceService = BlackSequenceService();

  Future<void> initialize() async {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    await DbProvider.instance.initialize();
    await _loadWordsIntoMemory();
    await _blackSequenceService.initialize();
    int time2 = DateTime.now().millisecondsSinceEpoch;

    print('initialized autocomplete service in ${time2 - time1} ms');
  }

  Future<void> _loadWordsIntoMemory() async {
    int maxLength =
        await wordRepository.queryMaxLengthByFrequency(FREQUENCY_BOUND - 1);
    int totalRecords = 0;
    while (maxLength > 0) {
      BurkhardKellerTree? bkTree = _lengthKeyBkMap[maxLength];
      if (bkTree == null) {
        bkTree = new BurkhardKellerTree(new WordEntity.fromString(ROOT_STRING));
        _lengthKeyBkMap[maxLength] = bkTree;
      }
      BurkhardKellerTree bk = bkTree;
      int curLength = maxLength;
      List<WordEntity> wordEntityList =
          await wordRepository.queryWordsByLengthAndGtFrequency(
        length: curLength,
        frequency: 45,
      );

      totalRecords += wordEntityList.length;
      bk.addAll(wordEntityList);
      maxLength--;
    }

    print('total Records loaded:$totalRecords');
  }

  // List<SuggestWord> matchInBkMaps(final String str) {
  //   int time1 = DateTime.now().millisecondsSinceEpoch;
  //   if (str == null || str.isEmpty) {
  //     return List.empty();
  //   }
  //   int length = str.length;
  //   ScoreMarker scoreMarker = new ScoreMarker(str);

  //   for (int keyLength in _lengthKeyBkMap.keys) {
  //     if (keyLength >= length && keyLength < length * 2) {
  //       List<StringDistanceInfo> partMatched =
  //           _lengthKeyBkMap[keyLength]!.matching(str, keyLength - length);
  //       if (partMatched == null || partMatched.isEmpty) {
  //         continue;
  //       }
  //       for (StringDistanceInfo info in partMatched) {
  //         WordEntity we = info.getMountObject() as WordEntity;
  //         scoreMarker.setMaxFrequency(we.frequency);
  //         SuggestWord sw = new SuggestWord(
  //             we.str, we.length, we.frequency, info.getDistance());
  //         scoreMarker.add(sw);
  //       }
  //     }
  //   }

  //   scoreMarker.markAndFilter();
  //   // print(
  //   //     '$str, ${scoreMarker.getSuggestWordList().length}, ${DateTime.now().millisecondsSinceEpoch - time1}');
  //   return scoreMarker.getSuggestWordList();
  // }

  Future<List<SuggestWord>> fuzzyMakeWord(
      final String inputLatinSequence) async {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    if (inputLatinSequence == null || inputLatinSequence.isEmpty) {
      return List.empty();
    }

    List<List<String>> decomposedLatinSequences =
        decomposer.decompose(inputLatinSequence);
    if (decomposedLatinSequences == null || decomposedLatinSequences.isEmpty) {
      return List.empty();
    }

    var suggestWordMap = new HashMap<String, SuggestWord>();

    // Original Java code uses synchronization
    // If performance is slow, try to improve this part
    List<Future> futures = [];

    for (List<String> latinSequence in decomposedLatinSequences) {
      List<LetterShapeSequence> letterShapeSequenceList =
          letterSplicer.fuzzy(latinSequence);
      if (letterShapeSequenceList == null || letterShapeSequenceList.isEmpty) {
        continue;
      }
      KeyFilter? keyFilter = keyFilterFactory
          .get(latinSequence[latinSequence.length - 1] + "-tail");
      for (LetterShapeSequence ls in letterShapeSequenceList) {
        String s = ls.toString();

        if (_blackSequenceService.contains(s)) {
          continue;
        }

        final Future future = compute(matchInBkMaps, {
          "bkTree": _lengthKeyBkMap,
          "str": s,
        }).then((result) {
          List<SuggestWord> partSuggestWord = result;
          if (partSuggestWord == null || partSuggestWord.isEmpty) {
            _blackSequenceService.add(s);
          }
          for (SuggestWord sw in partSuggestWord) {
            SuggestWord? tmp = suggestWordMap[sw.str];
            if (tmp != null && tmp.score > sw.score) {
              continue;
            }
            if (keyFilter == null || keyFilter.accept(sw.str)) {
              suggestWordMap[sw.str] = sw;
            }
          }
        });
        futures.add(future);
      }
    }

    await Future.wait(futures);

    //TODO: do it periodically when app is idle
    _blackSequenceService.persistNewRecords();
    List<SuggestWord> suggestWordList = new List.from(suggestWordMap.values);
    suggestWordList.sort((o1, o2) => o2.score.compareTo(o1.score));
    int time2 = DateTime.now().millisecondsSinceEpoch;
    print(
        "fuzzyMakeWord() key: $inputLatinSequence,run time:${time2 - time1}ms");
    return suggestWordList;
  }

  List<String> severeMakeWord(final String inputLatinSequence) {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    if (inputLatinSequence == null || inputLatinSequence.isEmpty) {
      return List.empty();
    }

    List<List<String>> decomposedLatinSequences =
        decomposer.decompose(inputLatinSequence);

    if (decomposedLatinSequences == null || decomposedLatinSequences.isEmpty) {
      return List.empty();
    }

    List<String> words = [];
    for (List<String> latinSequence in decomposedLatinSequences) {
      List<LetterShapeSequence> letterShapeSequenceList =
          letterSplicer.severe(latinSequence);
      if (letterShapeSequenceList == null || letterShapeSequenceList.isEmpty) {
        continue;
      }
      for (LetterShapeSequence lss in letterShapeSequenceList) {
        words.add(lss.toString());
      }
    }

    int time2 = DateTime.now().millisecondsSinceEpoch;
    return words;
  }

  Future<List<String>> makeWord(final String inputLatinSequence) async {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    if (inputLatinSequence == null || inputLatinSequence.isEmpty) {
      return List.empty();
    }
    List<String> words = [];
    List<String> severeMatchResult = this.severeMakeWord(inputLatinSequence);
    List<SuggestWord> fuzzyMatchSuggestResult =
        await this.fuzzyMakeWord(inputLatinSequence);
    List<String> fuzzyMatchResult =
        SuggestWord.convert(fuzzyMatchSuggestResult);

    if (fuzzyMatchResult == null || fuzzyMatchResult.isEmpty) {
      words.addAll(severeMatchResult);
    } else {
      if (severeMatchResult == null || severeMatchResult.isEmpty) {
        words.addAll(fuzzyMatchResult);
      } else {
        for (String severe in severeMatchResult) {
          if (fuzzyMatchResult.contains(severe)) {
            words.add(severe);
            fuzzyMatchResult.remove(severe);
          }
        }
        if (words == null || words.isEmpty) {
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
