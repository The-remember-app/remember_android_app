


import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

class ChoiceLearnButtonsProvider with ChangeNotifier {
  TermEntityDbDS? _buttonClicked = null;
  final TermEntityDbDS _correctButton;

  TermEntityDbDS get correctButton => _correctButton;

  ChoiceLearnButtonsProvider(this._correctButton);

  set buttonClicked(TermEntityDbDS? val) {
    if (this._buttonClicked != val) {
      this._buttonClicked = val;

      notifyListeners();
    }
  }

  TermEntityDbDS? get buttonClicked => _buttonClicked;

}
