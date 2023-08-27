

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
import '../buttom_navigation_templates/buttom_nav_bar.dart';
import 'app_bar_navigation_enum.dart';
import 'button_navigation.dart';

class MainNavigationMiddleware extends StatelessWidget{

  final Widget Function() child;
  final DFMapper dfMapper;

  MainNavigationMiddleware({required this.child, required this.dfMapper});


  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
        ChangeNotifierProvider(create: (context) => AppBarNavigationProvider()),
        ChangeNotifierProvider(create: (context) => ArrowBackNavigationProvider()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: AddBottomNavigationMiddleware(child: child, dfMapper: dfMapper,),
    );
  }
}


class AddProviderListeners extends StatefulWidget{

  final Widget Function() child;
  final DFMapper dfMapper;

  const AddProviderListeners({required this.dfMapper, required this.child});

  @override
  _AddProviderListenersState createState() => _AddProviderListenersState();

}

class _AddProviderListenersState extends State<AddProviderListeners>{
  @override
  Widget build(BuildContext context) {
    return  Consumer<BottomNavigationProvider>(builder: (context, bottomPagePr, child) {
      return Consumer<AppBarNavigationProvider>(builder: (context, appBarPagePr, child) {
        return Consumer<ArrowBackNavigationProvider>(builder: (context, arrowBackPagePr, child)
        {
          return widget.child();
        });

        });
      });
  }

}