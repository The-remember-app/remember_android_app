

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../domain_layer/providers/app_bar_navigation.dart';
import '../../../domain_layer/providers/arrrow_back_navigation.dart';
import '../../../domain_layer/providers/bottom_navigation_provider.dart';
import '../../navigation_processor.dart';
import '../abstract_ui.dart';
import '../appBarWidgets.dart';
import '../buttom_nav_bar.dart';
import 'app_bar_navigation_enum.dart';

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
    return  Consumer<BottomNavigationProvider>(builder: (context, userApi, child) {
      return Consumer<AppBarNavigationProvider>(builder: (context, userApi, child) {
        return Consumer<ArrowBackNavigationProvider>(builder: (context, userApi, child)
        {
          return widget.child();
        });

        });
      });
  }

}