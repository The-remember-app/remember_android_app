


import 'dart:core';

import 'package:flutter/cupertino.dart';

class AuthScreenProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _firstUserInit = true;

  set isLoading(bool val) {
    if (this._isLoading != val || _firstUserInit) {
      _firstUserInit = false;
      this._isLoading = val;

      notifyListeners();
    }
  }

  bool get isLoading => _isLoading;
}