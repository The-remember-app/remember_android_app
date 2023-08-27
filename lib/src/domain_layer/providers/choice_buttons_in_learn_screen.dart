import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:the_remember/src/domain_layer/providers/terms_in_module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import '../../urils/profilers/abstract.dart';
import 'learning_navigation.dart';

class ChoiceLearnButtonsProvider extends ModChangeNotifier {
  final TermsInModuleProvider termsPr;
  final LearnScreensNavigationProvider learnNavPr;
  late TermEntityDbDS? _buttonClicked;
  TermEntityDbDS get  _correctButton => termsPr.learningIterationTermsList![learnNavPr.activePageNumber];

  TermEntityDbDS get correctButton => _correctButton;

  ChoiceLearnButtonsProvider(this.termsPr, this.learnNavPr): super()  {
    // init();
  }

  @override
  void init({bool isRealInit = false}) {
    _buttonClicked = null;
    super.init(isRealInit: isRealInit);
  }

  set buttonClicked(TermEntityDbDS? val) {
    if (this._buttonClicked != val) {
      this._buttonClicked = val;

      notifyListeners();
    }
  }

  TermEntityDbDS? get buttonClicked => _buttonClicked;
}
