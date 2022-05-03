import 'dart:collection';

import 'package:ime_mongol_package/filter/btail_key_filter.dart';
import 'package:ime_mongol_package/filter/key_filter.dart';

class KeyFilterFactory {
  final filterMap = HashMap<String, KeyFilter>();

  KeyFilterFactory() {
    BTailKeyFilter bTailKeyFilter = BTailKeyFilter();
    filterMap[bTailKeyFilter.getKey()] = bTailKeyFilter;
  }

  KeyFilter? get(String key) {
    return filterMap[key];
  }
}
