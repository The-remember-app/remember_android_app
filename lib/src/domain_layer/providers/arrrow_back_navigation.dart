import 'dart:core';

import 'package:flutter/cupertino.dart';

import '../../ui/ui_templates/navigation/app_bar_navigation_enum.dart';
import '../../urils/profilers/abstract.dart';

class ArrowBackNavigationProvider extends ModChangeNotifier {
  ArrowBackNavigationProvider(): super()  {
    // init();
  }

  @override
  void init({bool isRealInit = false}) {
    super.init(isRealInit: isRealInit);
  }

// int _activePageNumber = 0;
// bool _firstUserInit = true;
//
// set activePageNumber(int val) {
//   if (this._activePageNumber != val || _firstUserInit) {
//     _firstUserInit = false;
//     this._activePageNumber = val;
//
//     notifyListeners();
//   }
// }
//
// int get activePageNumber => _activePageNumber;
}
