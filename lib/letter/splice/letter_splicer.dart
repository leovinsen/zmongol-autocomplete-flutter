
  import '../letter_shape.dart';
import '../letter_shape_sequence.dart';

class LetterSplicer {

      List<LetterShapeSequence> fuzzy(List<String> latinSequence) {
        long time1 = Instant.now().toEpochMilli();
        try {
          if(latinSequence.isEmpty) {
            return [];
          }
            var completeLssList = <LetterShapeSequence>[];
            int i = 0;
            for (String key in latinSequence) {
                var letterShapeList =  <LetterShape>[];
                if (i == 0) {
                    letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.HEAD));
                } else if (i == latinSequence.size() - 1) {
                    letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.MIDDLE));
                    letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.TAIL));
                } else {
                    letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.MIDDLE));
                }
                i++;

                if (CollectionUtils.isEmpty(letterShapeList)) {
                    continue;
                }
                int size = (completeLssList.size() > 0 ? completeLssList.size() : 1) * letterShapeList.size();
                List<LetterShapeSequence> newWholeLssList = Lists.newArrayListWithExpectedSize(size);

                LetterShapeSequence lss;
                if (CollectionUtils.isEmpty(completeLssList)) {
                    for (LetterShape letterShape : letterShapeList) {
                        if (Verifier.canFuzzySplicing(LetterShapeSequence.emptyLss(), letterShape)) {
                            lss = new LetterShapeSequence();
                            lss.append(letterShape);
                            newWholeLssList.add(lss);
                        } else {
                            logger.info("ignored:{}", letterShape.toString());
                        }
                    }
                } else {
                    for (LetterShape letterShape : letterShapeList) {
                        for (LetterShapeSequence clss : completeLssList) {
                            if (Verifier.canFuzzySplicing(clss, letterShape)) {
                                lss = new LetterShapeSequence();
                                lss.append(clss);
                                lss.append(letterShape);
                                newWholeLssList.add(lss);
                            } else {
                                logger.info("ignored:{},{}", clss.toString(), letterShape.toString());
                            }
                        }
                    }
                }
                completeLssList = newWholeLssList;
            }
            return completeLssList;
        } finally {
            logger.info("latin to zcode run time:{}", Instant.now().toEpochMilli() - time1);
        }
    }

      List<LetterShapeSequence> severe(List<String> latinSequence) {
        long time1 = Instant.now().toEpochMilli();
        try {
            if (CollectionUtils.isEmpty(latinSequence)) {
                return Collections.emptyList();
            }
            List<LetterShapeSequence> completeLssList = new ArrayList<>();
            int i = 0;
            for (String key : latinSequence) {
                List<LetterShape> letterShapeList = new LinkedList<>();
                if (i == 0) {
                    letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.HEAD));
                } else if (i == latinSequence.size() - 1) {
                    letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.TAIL));
                } else {
                    letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.MIDDLE));
                }
                i++;

                if (CollectionUtils.isEmpty(letterShapeList)) {
                    continue;
                }
                int size = (completeLssList.size() > 0 ? completeLssList.size() : 1) * letterShapeList.size();
                List<LetterShapeSequence> newWholeLssList = Lists.newArrayListWithExpectedSize(size);

                LetterShapeSequence lss;
                if (CollectionUtils.isEmpty(completeLssList)) {
                    for (LetterShape letterShape : letterShapeList) {
                        if (Verifier.canSevereSplicing(LetterShapeSequence.emptyLss(), letterShape)) {
                            lss = new LetterShapeSequence();
                            lss.append(letterShape);
                            newWholeLssList.add(lss);
                        } else {
                            logger.info("ignored:{}", letterShape);
                        }
                    }
                } else {
                    for (LetterShape letterShape : letterShapeList) {
                        for (LetterShapeSequence clss : completeLssList) {
                            if (Verifier.canSevereSplicing(clss, letterShape)) {
                                lss = new LetterShapeSequence();
                                lss.append(clss);
                                lss.append(letterShape);
                                newWholeLssList.add(lss);
                            } else {
                                logger.info("ignored:{},{}", clss.toString(), letterShape);
                            }
                        }
                    }
                }
                completeLssList = newWholeLssList;
            }
            return completeLssList;
        } finally {
            logger.info("latin to zcode run time:{}", Instant.now().toEpochMilli() - time1);
        }
    }
}
