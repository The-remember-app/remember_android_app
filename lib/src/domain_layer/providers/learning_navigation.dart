import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/domain_layer/providers/terms_in_module.dart';
import 'package:the_remember/src/domain_layer/providers/user_api_provider.dart';
import 'package:the_remember/src/urils/db/abstract_entity.dart';
import 'package:the_remember/src/urils/db/dbMixins.dart';

import '../functions/words_BO.dart';
import 'module_buttoons_navigation.dart';
import '../../urils/profilers/abstract.dart';

class LearnScreensNavigationProvider extends ModChangeNotifier {
  late int _activePageNumber = 0;
  late bool _firstUserInit = true;
  final UserApiProfile _userPr;
  final TermsInModuleProvider _termsPr;
  final ModuleButtonNavigationProvider _moduleNavPr;
  late Map<int, bool> buttonPressed;

  LearnScreensNavigationProvider(this._userPr, this._termsPr, this._moduleNavPr): super()  {
    // init();
  }

  @override
  void init({bool isRealInit = false}) {
    _activePageNumber = 0;
    _firstUserInit = true;

    super.init(isRealInit: isRealInit);
  }

  set activePageNumber(int val) {
    if (this._activePageNumber != val || _firstUserInit) {
      _firstUserInit = false;
      this._activePageNumber = val;
      if (iterationFinished) {
        // learnTransactionCompleted();
        learnTransactionCompleted(
            _termsPr.changedInLearningIterationTermsList ?? [],
            _userPr
        );

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

  bool get iterationFinished =>
      _termsPr.learningIterationTermsList!.length <= _activePageNumber;

  bool get learnFinished => _termsPr.learningIterationTermsList!.isEmpty;

  bool get learnNotStarted => _termsPr.learningIterationTermsList == null;

  @override
  List<CollectionSchema<AbstractEntity>> get classes => [];

  @override
  void dispose(){
    super.dispose();


  }
}
