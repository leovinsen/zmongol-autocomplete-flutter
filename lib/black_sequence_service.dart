import 'dart:collection';

import 'package:ime_mongol_package/data/black_sequence_repository.dart';
import 'package:ime_mongol_package/model/black_sequence.dart';

class BlackSequenceService {
  BlackSequenceRepository _repository = new BlackSequenceRepository();

  final _blackSet = HashSet<String>();
  final _newBlackSet = HashSet<String>();

  Future<void> initialize() async {
    await _loadSequencesIntoMemory();
  }

  Future<void> _loadSequencesIntoMemory() async {
    List<BlackSequence> result = await _repository.queryAll();
    print('loading black sequence: ${result.length}');
    result.forEach((res) => _blackSet.add(res.str));
  }

  bool contains(String src) =>
      _blackSet.contains(src) || _newBlackSet.contains(src);

  void add(String src) {
    _newBlackSet.add(src);
  }

  void persistNewRecords() {
    print('persisting: ${_newBlackSet.length} records');
    _repository.insertAll(List.from(_newBlackSet));
    _blackSet.addAll(_newBlackSet);
    _newBlackSet.clear();
  }

  // @Scheduled(initialDelay = 1000, fixedRate = 5 * 1000)
  // public void syn() {
  //     logger.info("BlackSequenceService.syn start...");
  //     if (newBlackSet.size() > 0) {
  //         logger.info("syn black sequence size:{}", newBlackSet.size());
  //         blackSequenceRepository.insertAll(newBlackSet);
  //         blackSet.addAll(newBlackSet);
  //         newBlackSet.clear();
  //     }
  //     logger.info("BlackSequenceService.syn end");
  // }
}
