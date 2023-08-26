


import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/domain_layer/providers/terms_in_module.dart';
import 'package:the_remember/src/urils/db/abstract_entity.dart';
import 'package:the_remember/src/urils/db/dbMixins.dart';

import 'module_buttoons_navigation.dart';

class LearnScreensNavigationProvider with ChangeNotifier, OpenAndClose {
  int _activePageNumber = 0;
  bool _firstUserInit = true;
  final TermsInModuleProvider _termsPr;
  final ModuleButtonNavigationProvider _moduleNavPr;

  LearnScreensNavigationProvider(this._termsPr, this._moduleNavPr);

  set activePageNumber(int val) {
    if (this._activePageNumber != val || _firstUserInit) {
      _firstUserInit = false;
      this._activePageNumber = val;
      if (iterationFinished){
        _moduleNavPr.buttonType = ModuleButtonNavigationEnum.mainModuleScreen;
      } else {
        // else if (learnFinished) {
        //   learnNavPr.learnFinished
        //   _moduleNavPr.buttonType = ModuleButtonNavigationEnum.startLearn;
        // }

        notifyListeners();
      }
    }
  }

  int get activePageNumber => _activePageNumber;

  bool get iterationFinished => _termsPr.learningIterationTermsList!.length <= _activePageNumber;
  bool get learnFinished => _termsPr.learningIterationTermsList!.isEmpty;
  bool get learnNotStarted=> _termsPr.learningIterationTermsList == null;
  @override
  List<CollectionSchema<AbstractEntity>> get classes => [];
}
