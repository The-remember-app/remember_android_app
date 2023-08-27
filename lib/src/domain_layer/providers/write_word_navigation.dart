import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:the_remember/src/domain_layer/providers/terms_in_module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../urils/profilers/abstract.dart';
import 'learning_navigation.dart';

class WriteWordNavigationProvider extends ModChangeNotifier {
  late String? _writtenWord;
  TermEntityDbDS get _targetWord => termsPr.learningIterationTermsList![learnNavPr.activePageNumber];
  final LearnScreensNavigationProvider learnNavPr;
  final TermsInModuleProvider termsPr;

  WriteWordNavigationProvider(this.termsPr, this.learnNavPr): super()  {
    // init(isRealInit: true);
  }

  @override
  void init({bool isRealInit = false}) {
    parentProvidersList[learnNavPr.runtimeType] = learnNavPr;
    _writtenWord = null;
    super.init(isRealInit: isRealInit);
  }

  String? get writtenWord => _writtenWord;

  set writtenWord(String? value) {
    _writtenWord = value;
    notifyListeners();
  }

  TermEntityDbDS get targetWord => _targetWord;
}
