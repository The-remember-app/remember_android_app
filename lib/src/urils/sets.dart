


import 'dart:math';

Map<K, int> mapCounterDifference<K>(Map<K, int> one, Map<K, int> two, {bool zeroInclude = false}){
  Map<K, int> res = {};
  for (var kv in one.entries){
    var count = max( kv.value - (two[kv.key] ?? 0), 0);
    if (!zeroInclude && count == 0){

    } else {
      res[kv.key] =count;
    }
  }

  return res;
}