import 'dart:core';

import '../../../urils/profilers/abstract.dart';

class AuthScreenProvider extends ModChangeNotifier {
  late bool _isLoading;
  late bool _firstUserInit ;

  AuthScreenProvider(): super()  {
    // init();
  }

  @override
  void init({bool isRealInit = false}) {
     _isLoading = false;
     _firstUserInit = true;
    super.init(isRealInit: isRealInit);
  }

  set isLoading(bool val) {
    if (this._isLoading != val || _firstUserInit) {
      _firstUserInit = false;
      this._isLoading = val;

      notifyListeners();
    }
  }

  bool get isLoading => _isLoading;
}
