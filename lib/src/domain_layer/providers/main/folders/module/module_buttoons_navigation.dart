import 'dart:core';

import 'package:the_remember/src/domain_layer/providers/main/folders/module/terms_in_module.dart';
import 'package:the_remember/src/domain_layer/providers/user_api_provider.dart';

import '../../../../../urils/profilers/abstract.dart';
import '../../../../functions/words_BO.dart';

enum ModuleButtonNavigationEnum {
  startLearn,
  continueLearn,
  moduleSettings,
  mainModuleScreen
}

class ModuleButtonNavigationProvider extends ModChangeNotifier {
  final TermsInModuleProvider termPr;
  final UserApiProfile userPr;
  late ModuleButtonNavigationEnum _buttonType ;
  late bool _firstUserInit ;

  ModuleButtonNavigationProvider(this.termPr, this.userPr): super()  {
    // init();
  }

  @override
  void init({bool isRealInit = false}) {
    _buttonType =
        ModuleButtonNavigationEnum.mainModuleScreen;
    _firstUserInit = true;
    super.init(isRealInit: isRealInit);
  }

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

  void setButtonTypeWithoutSetState(ModuleButtonNavigationEnum val) {
    if (this._buttonType != val || _firstUserInit) {
      _firstUserInit = false;
      this._buttonType = val;
    }
  }

  ModuleButtonNavigationEnum get buttonType => _buttonType;
}
