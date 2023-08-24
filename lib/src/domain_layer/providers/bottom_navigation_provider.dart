


import 'dart:core';

import 'package:flutter/cupertino.dart';

class BottomNavigationProvider with ChangeNotifier {
  int _activePageNumber = 0;
  bool _firstUserInit = true;

  set activePageNumber(int val) {
    if (this._activePageNumber != val || _firstUserInit) {
      _firstUserInit = false;
      this._activePageNumber = val;

      notifyListeners();
    }
  }

  int get activePageNumber => _activePageNumber;

  Widget Function(BuildContext)? _bottomNavWidget = null;

  Widget Function(BuildContext)? get bottomNavWidget => _bottomNavWidget;

  set bottomNavWidget( Widget Function(BuildContext)? value) {
    _bottomNavWidget = value;
  }
}
