import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:the_remember/src/domain_layer/providers/terms_in_module.dart';
import 'package:the_remember/src/domain_layer/providers/user_api_provider.dart';

import '../functions/words_BO.dart';


enum ModuleButtonNavigationEnum{
  startLearn, continueLearn, moduleSettings, mainModuleScreen
}


class ModuleButtonNavigationProvider with ChangeNotifier {
  final TermsInModuleProvider termPr;
  final UserApiProfile userPr;
  ModuleButtonNavigationEnum _buttonType = ModuleButtonNavigationEnum.mainModuleScreen;
  bool _firstUserInit = true;

  ModuleButtonNavigationProvider(this.termPr, this.userPr);

  set buttonType(ModuleButtonNavigationEnum val) {
    if (this._buttonType != val || _firstUserInit) {
      _firstUserInit = false;
      this._buttonType = val;
      if (val == ModuleButtonNavigationEnum.startLearn) {
        startLearning(termPr, userPr);
        buttonType = ModuleButtonNavigationEnum.continueLearn;
      }

      notifyListeners();
    }
  }

  void setButtonTypeWithoutSetState(ModuleButtonNavigationEnum val){
    if (this._buttonType != val || _firstUserInit) {
      _firstUserInit = false;
      this._buttonType = val;
    }
  }

  ModuleButtonNavigationEnum get buttonType => _buttonType;

}
