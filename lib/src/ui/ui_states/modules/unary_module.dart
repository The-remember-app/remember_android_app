import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../domain_layer/providers/app_bar_navigation.dart';
import '../../../domain_layer/providers/bottom_navigation_provider.dart';
import '../../../domain_layer/providers/folder_module.dart';
import '../../../domain_layer/providers/module_buttoons_navigation.dart';
import '../../../domain_layer/providers/terms_in_module.dart';
import '../../pages/modules/module_settings.dart';
import '../../pages/modules/unary_module.dart';
import '../../ui_templates/abstract_ui.dart';
import '../../ui_templates/navigation/app_bar_navigation_enum.dart';
import '../main_content.dart';

class ModuleWithTerms extends StatelessWidget {
  final DFMapper dfMapper;

  const ModuleWithTerms({super.key, required this.dfMapper});

  @override
  Widget build(BuildContext context) {
    var fmPr = Provider.of<FolderAndModuleProvider>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TermsInModuleProvider(fmPr: fmPr)),
        ChangeNotifierProvider(
            create: (context) => ModuleButtonNavigationProvider()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: ModuleScreenChoice(
        dfMapper: dfMapper,
      ),
    );
  }
}

class ModuleScreenChoice extends StatefulWidget {
  final DFMapper dfMapper;

  const ModuleScreenChoice({super.key, required this.dfMapper});

  @override
  _ModuleScreenChoiceState createState() => _ModuleScreenChoiceState();
}

class _ModuleScreenChoiceState
    extends AbstractUIStatefulWidget<ModuleScreenChoice> {
  @override
  Widget build(BuildContext context) {
    var fmPr = Provider.of<FolderAndModuleProvider>(context, listen: false);
    var bottomPagePr =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    var appBarPagePr =
        Provider.of<AppBarNavigationProvider>(context, listen: false);

    return Consumer<ModuleButtonNavigationProvider>(
        builder: (context, moduleNavPr, child) {
      // Future _future = fmPr.
      return choiceNextScreen(
          context, fmPr, bottomPagePr, appBarPagePr, moduleNavPr);
    });
  }

  Widget choiceNextScreen(
    BuildContext context,
    FolderAndModuleProvider fmPr,
    BottomNavigationProvider bottomPagePr,
    AppBarNavigationProvider appBarPagePr,
    ModuleButtonNavigationProvider moduleNavPr,
  ) {
    if (moduleNavPr.buttonType == ModuleButtonNavigationEnum.mainModuleScreen) {
      return Wapper(
        appBar: appBarPagePr.getAppBarWidget[AppBarNavigationEnum.arrowBack]!(
            context, widget.dfMapper),
        body: UnaryModule(),
        bottomNavigationBar: bottomPagePr.bottomNavWidget!(context),
        dfMapper: widget.dfMapper,
        onWillPop: () async {
          fmPr.currentFolder = fmPr.currentFolder;
          return false;
        },
        appBarEmulate:
            AppBarEmulate(title: fmPr.currentModule?.name ?? "unknown error"),
      );
    } else if (moduleNavPr.buttonType ==
        ModuleButtonNavigationEnum.moduleSettings) {
      return Wapper(
        appBar: appBarPagePr.getAppBarWidget[AppBarNavigationEnum.arrowBack]!(
            context, widget.dfMapper),
        body: ModuleSettingsScreen(),
        bottomNavigationBar: bottomPagePr.bottomNavWidget!(context),
        dfMapper: widget.dfMapper,
        onWillPop: () async {
          moduleNavPr.buttonType = ModuleButtonNavigationEnum.mainModuleScreen;
          return false;
        },
        appBarEmulate: AppBarEmulate(title: "Learn settings"),
      );
    }
    return Wapper(
      appBar: appBarPagePr.getAppBarWidget[AppBarNavigationEnum.arrowBack]!(
          context, widget.dfMapper),
      body: Text('Не инициализировано'),
      bottomNavigationBar: bottomPagePr.bottomNavWidget!(context),
      dfMapper: widget.dfMapper,
      onWillPop: () async {
        moduleNavPr.buttonType = ModuleButtonNavigationEnum.mainModuleScreen;
        return false;
      },
      appBarEmulate: AppBarEmulate(title: "Learn settings"),
    );
  }
}
