

import 'package:flutter/cupertino.dart';

import '../db/dbMixins.dart';

abstract class ModChangeNotifier extends ChangeNotifier with OpenAndClose
{

  bool _isDispose = false;

  void init();

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }

  @override
  void notifyListeners(){
    if (!_isDispose) {
      super.notifyListeners();
    }
  }

}