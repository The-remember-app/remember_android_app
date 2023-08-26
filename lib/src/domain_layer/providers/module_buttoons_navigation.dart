import 'dart:core';

import 'package:flutter/cupertino.dart';


enum ModuleButtonNavigationEnum{
  startLearn, continueLearn, moduleSettings, mainModuleScreen
}


class ModuleButtonNavigationProvider with ChangeNotifier {
  ModuleButtonNavigationEnum _buttonType = ModuleButtonNavigationEnum.mainModuleScreen;
  bool _firstUserInit = true;

  set buttonType(ModuleButtonNavigationEnum val) {
    if (this._buttonType != val || _firstUserInit) {
      _firstUserInit = false;
      this._buttonType = val;

      notifyListeners();
    }
  }

  ModuleButtonNavigationEnum get buttonType => _buttonType;

}
