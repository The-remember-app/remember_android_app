


import 'dart:core';

import 'package:flutter/cupertino.dart';

import '../../ui/ui_templates/abstract_ui.dart';
import '../../ui/ui_templates/navigation/app_bar_navigation_enum.dart';

class AppBarNavigationProvider with ChangeNotifier {
  Map<AppBarNavigationEnum, PreferredSizeWidget Function(BuildContext, DFMapper)> _getAppBarWidget =
  Map();

  Map<AppBarNavigationEnum, PreferredSizeWidget Function(BuildContext, DFMapper)>
  get getAppBarWidget => _getAppBarWidget;

  set getAppBarWidget(
      Map<AppBarNavigationEnum, PreferredSizeWidget Function(BuildContext, DFMapper)> value) {
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
