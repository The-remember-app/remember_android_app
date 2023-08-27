import 'dart:core';

import 'package:flutter/cupertino.dart';
import '../../urils/profilers/abstract.dart';

class BottomNavigationProvider extends ModChangeNotifier {
  late int _activePageNumber ;
  late bool _firstUserInit ;

  BottomNavigationProvider() : super() {
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

      notifyListeners();
    }
  }

  int get activePageNumber => _activePageNumber;

  Widget Function(BuildContext)? _bottomNavWidget = null;

  Widget Function(BuildContext)? get bottomNavWidget => _bottomNavWidget;

  set bottomNavWidget(Widget Function(BuildContext)? value) {
    _bottomNavWidget = value;
  }
}
