import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../domain_layer/providers/main/main_navigation/app_bar_navigation.dart';
import '../../../domain_layer/providers/main/main_navigation/arrrow_back_navigation.dart';
import '../../../domain_layer/providers/main/main_navigation/bottom_navigation_provider.dart';
// import '../../../domain_layer/providers/main_navigation/app_bar_navigation.dart';
// import '../../../domain_layer/providers/main_navigation/arrrow_back_navigation.dart';
// import '../../../domain_layer/providers/main_navigation/bottom_navigation_provider.dart';
import '../../ui_states/navigation_processor.dart';
import '../abstract_ui.dart';
// import '../appBarWidgets.dart';
import '../app_bar_templates/arrow_back_only.dart';
import '../app_bar_templates/empty.dart';
import '../buttom_navigation_templates/buttom_nav_bar.dart';
import 'app_bar_navigation_enum.dart';
import 'arrow_back_navigation.dart';


class AddAppBarNavigationMiddleware extends StatelessWidget{

  final Widget Function() child;
  final DFMapper dfMapper;

  AddAppBarNavigationMiddleware({required this.child, required this.dfMapper});

  @override
  Widget build(BuildContext context)  {
    var appBarPagePr = Provider.of<AppBarNavigationProvider>(context, listen: false);
    appBarPagePr.getAppBarWidget = {
      AppBarNavigationEnum.empty: (BuildContext context, DFMapper dfMapper) => EmptyAppBar(dfMapper: dfMapper),
      AppBarNavigationEnum.arrowBack: (BuildContext context, DFMapper dfMapper) => ArrowBackAppBar(dfMapper: dfMapper),
    };
    return AddWillPopScopeNavigationMiddleware(child: child, dfMapper: dfMapper,);
  }
}

