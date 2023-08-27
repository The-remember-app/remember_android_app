

import 'package:flutter/cupertino.dart';

import '../db/dbMixins.dart';

abstract class ModChangeNotifier extends ChangeNotifier with OpenAndClose
{

  bool _isDispose = false;
  Map<Type, ModChangeNotifier?> subProvidersList = {};
  Map<Type, ModChangeNotifier?> parentProvidersList = {};

  ModChangeNotifier(){
    init(isRealInit: true);
  }

  @mustCallSuper
  void init({bool isRealInit = false}){
    for(var i in parentProvidersList.entries){
      i.value?.subProvidersList[this.runtimeType] = this;
    }
    if (!isRealInit) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDispose = true;
    for(var i in parentProvidersList.entries){
      i.value?.subProvidersList[this.runtimeType] = null;
    }
    super.dispose();
    // Type ddd = this.runtimeType;
  }

  @override
  void notifyListeners(){
    if (!_isDispose) {
      super.notifyListeners();
      for(var i in subProvidersList.entries){
        i.value?.init();
      }
    }
  }

}