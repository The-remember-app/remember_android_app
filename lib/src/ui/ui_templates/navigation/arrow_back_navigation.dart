import 'package:flutter/cupertino.dart';

import '../abstract_ui.dart';
import 'main_navigation_middleware.dart';

class AddWillPopScopeNavigationMiddleware extends StatelessWidget{

  final Widget Function() child;
  final DFMapper dfMapper;

  AddWillPopScopeNavigationMiddleware({required this.child, required this.dfMapper});

  @override
  Widget build(BuildContext context)  {
    return
      WillPopScope(
          child: AddProviderListeners(child: child, dfMapper: dfMapper,),
          onWillPop: () async {
            return await dfMapper.onWillPop();
          }
      );
  }
}