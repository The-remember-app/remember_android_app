import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../../domain_layer/providers/main_navigation/app_bar_navigation.dart';
// import '../../domain_layer/providers/main_navigation/bottom_navigation_provider.dart';
import '../../domain_layer/providers/main/main_navigation/app_bar_navigation.dart';
import '../../domain_layer/providers/main/main_navigation/bottom_navigation_provider.dart';
import '../../test_ui_page.dart';
import '../pages/settings/MyAccountScreen.dart';
import '../ui_templates/abstract_ui.dart';
import '../ui_templates/navigation/app_bar_navigation_enum.dart';
import '../ui_templates/navigation/main_navigation_middleware.dart';
import '../ui_templates/skeleton.dart';
import 'modules/folders_and_modules_choice.dart';

class MainContent extends StatelessWidget {
  MainContent() : super();

  @override
  Widget build(BuildContext context) {
    var dfMapper = DFMapper();
    return MainNavigationMiddleware(
        child: () => PageChoice(
          dfMapper: dfMapper,
        ),
        dfMapper: dfMapper);
  }
}

class AppBarEmulate {
  String? title;
  Function? arrowBackFunc;

  AppBarEmulate({this.title, this.arrowBackFunc});
}

class Wapper extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final DFMapper dfMapper;
  final AppBarEmulate? appBarEmulate;
  final Future<bool> Function()? onWillPop;

  Wapper({
    required this.appBar,
    required this.body,
    required this.bottomNavigationBar,
    required this.dfMapper,
    this.appBarEmulate,
    this.onWillPop,
  }) {
    dfMapper.onWillPop = this.onWillPop ?? () async => false;
    dfMapper.appBarEmulate = (this.appBarEmulate ?? AppBarEmulate());
    dfMapper.appBarEmulate
      ..title ??= ""
      ..arrowBackFunc ??= dfMapper.onWillPop;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SkeletonWidget(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class PageChoice extends StatelessWidget {
  final DFMapper dfMapper;

  const PageChoice({required this.dfMapper});

  @override
  Widget build(BuildContext context) {
    var bottomPagePr =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    var appBarPagePr =
        Provider.of<AppBarNavigationProvider>(context, listen: false);
    return choiceNextScreen(context, bottomPagePr, appBarPagePr);
  }

  Widget choiceNextScreen(
      BuildContext context,
      BottomNavigationProvider bottomPagePr,
      AppBarNavigationProvider appBarPagePr) {
    if (bottomPagePr.activePageNumber == 0) {
      return FoldersAndModulesProcessor(dfMapper: dfMapper);
    } else if (bottomPagePr.activePageNumber == 4) {
      return Wapper(
        appBar: appBarPagePr.getAppBarWidget[AppBarNavigationEnum.arrowBack]!(
            context, dfMapper),
        body: MyAccountScreen(),
        bottomNavigationBar: bottomPagePr.bottomNavWidget!(context),
        dfMapper: dfMapper,
        onWillPop: () async {
          bottomPagePr.activePageNumber = 0;
          return false;
        },
        appBarEmulate: AppBarEmulate(title: 'My account'),
      );
    } else if (bottomPagePr.activePageNumber == 1) {
      return Wapper(
        appBar: appBarPagePr.getAppBarWidget[AppBarNavigationEnum.arrowBack]!(
            context, dfMapper),
        body: TestUiPage(),
        bottomNavigationBar: bottomPagePr.bottomNavWidget!(context),
        dfMapper: dfMapper,
        onWillPop: () async {
          bottomPagePr.activePageNumber = 0;
          return false;
        },
        appBarEmulate: AppBarEmulate(title: 'Ещё не реализовано'),
      );

    } else {
      return Wapper(
        appBar: appBarPagePr.getAppBarWidget[AppBarNavigationEnum.arrowBack]!(
            context, dfMapper),
        body: Container(),
        bottomNavigationBar: bottomPagePr.bottomNavWidget!(context),
        dfMapper: dfMapper,
        onWillPop: () async {
          bottomPagePr.activePageNumber = 0;
          return false;
        },
        appBarEmulate: AppBarEmulate(title: 'Ещё не реализовано'),
      );
    }
  }
}
