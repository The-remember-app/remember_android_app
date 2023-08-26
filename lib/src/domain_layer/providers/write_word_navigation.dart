


import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

class WriteWordNavigationProvider with ChangeNotifier {
  String? _writtenWord = null;
  final TermEntityDbDS _targetWord;

  WriteWordNavigationProvider(this._targetWord);

  String? get writtenWord => _writtenWord;

  set writtenWord(String? value) {
    _writtenWord = value;
    notifyListeners();
  }

  TermEntityDbDS get targetWord => _targetWord;

}
