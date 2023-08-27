import 'dart:core';

import 'package:flutter/cupertino.dart';

import '../../ui/ui_templates/abstract_ui.dart';
import '../../ui/ui_templates/navigation/app_bar_navigation_enum.dart';
import '../../urils/profilers/abstract.dart';
import '../../urils/profilers/abstract.dart';

class AppBarNavigationProvider extends ModChangeNotifier {
  late  Map<AppBarNavigationEnum,
          PreferredSizeWidget Function(BuildContext, DFMapper)>
      _getAppBarWidget ;

  AppBarNavigationProvider(): super() {

  }

  @override
  void init({bool isRealInit = false}) {
    _getAppBarWidget = Map();
    super.init(isRealInit: isRealInit);
  }

  Map<AppBarNavigationEnum,
          PreferredSizeWidget Function(BuildContext, DFMapper)>
      get getAppBarWidget => _getAppBarWidget;

  set getAppBarWidget(
      Map<AppBarNavigationEnum,
              PreferredSizeWidget Function(BuildContext, DFMapper)>
          value) {
    _getAppBarWidget = value;
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
