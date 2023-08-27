import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../domain_layer/providers/main/main_navigation/bottom_navigation_provider.dart';
import '../abstract_ui.dart';
// import '../appBarWidgets.dart';
import '../buttom_navigation_templates/buttom_nav_bar.dart';
import 'app_bar_navigation.dart';

class AddBottomNavigationMiddleware extends StatelessWidget{

  final Widget Function() child;
  final DFMapper dfMapper;

  AddBottomNavigationMiddleware({required this.child, required this.dfMapper});

  @override
  Widget build(BuildContext context)  {
    var bottomPagePr = Provider.of<BottomNavigationProvider>(context, listen: false);
    bottomPagePr.bottomNavWidget = (BuildContext context) => MainBottomNavigationBar();
    return AddAppBarNavigationMiddleware(child: child, dfMapper: dfMapper,);
  }

}