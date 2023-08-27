import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../domain_layer/functions/words_BO.dart';
// import '../../../domain_layer/providers/main_navigation/app_bar_navigation.dart';
// import '../../../domain_layer/providers/main_navigation/bottom_navigation_provider.dart';
// import '../../../domain_layer/providers/folders/folder_module.dart';
// import '../../../domain_layer/providers/folders/module/module_buttoons_navigation.dart';
// import '../../../domain_layer/providers/folders/module/terms_in_module.dart';
import '../../../domain_layer/providers/main/folders/folder_module.dart';
import '../../../domain_layer/providers/main/folders/module/module_buttoons_navigation.dart';
import '../../../domain_layer/providers/main/folders/module/terms_in_module.dart';
import '../../../domain_layer/providers/main/main_navigation/app_bar_navigation.dart';
import '../../../domain_layer/providers/main/main_navigation/bottom_navigation_provider.dart';
import '../../../domain_layer/providers/user_api_provider.dart';
import '../../pages/modules/module_settings.dart';
import '../../pages/modules/unary_module.dart';
import '../../ui_templates/abstract_ui.dart';
import '../../ui_templates/navigation/app_bar_navigation_enum.dart';
import '../main_content.dart';
import 'learning/learn_screen_choice.dart';

class ModuleWithTerms extends StatelessWidget {
  final DFMapper dfMapper;

  const ModuleWithTerms({super.key, required this.dfMapper});

  @override
  Widget build(BuildContext context) {
    var fmPr = Provider.of<FolderAndModuleProvider>(context, listen: false);
    var userPr = Provider.of<UserApiProfile>(context, listen: false);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => TermsInModuleProvider(fmPr: fmPr)),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => ModuleButtonNavigationProvider(
                    Provider.of<TermsInModuleProvider>(context, listen: false),
                    userPr)),
          ],
          child: ModuleScreenChoice(
            dfMapper: dfMapper,
          ),
        )
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
    var userPr = Provider.of<UserApiProfile>(context, listen: false);
    var termsPr = Provider.of<TermsInModuleProvider>(context, listen: false);
    var fmPr = Provider.of<FolderAndModuleProvider>(context, listen: false);
    var bottomPagePr =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    var appBarPagePr =
        Provider.of<AppBarNavigationProvider>(context, listen: false);

    return Consumer<ModuleButtonNavigationProvider>(
        builder: (context, moduleNavPr, child) {
      // Future _future = fmPr.
      return choiceNextScreen(context, userPr, fmPr, bottomPagePr, appBarPagePr,
          moduleNavPr, termsPr);
    });
  }

  Widget choiceNextScreen(
      BuildContext context,
      UserApiProfile userPr,
      FolderAndModuleProvider fmPr,
      BottomNavigationProvider bottomPagePr,
      AppBarNavigationProvider appBarPagePr,
      ModuleButtonNavigationProvider moduleNavPr,
      TermsInModuleProvider termsPr) {
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
    } else if (moduleNavPr.buttonType ==
        ModuleButtonNavigationEnum.continueLearn) {
      return Wapper(
        appBar: appBarPagePr.getAppBarWidget[AppBarNavigationEnum.arrowBack]!(
            context, widget.dfMapper),
        body: LearnScreenProcessor(),
        bottomNavigationBar: null,
        dfMapper: widget.dfMapper,
        onWillPop: () async {
          learnTransactionCompleted(
              termsPr.changedInLearningIterationTermsList ?? [], userPr);
          moduleNavPr.buttonType = ModuleButtonNavigationEnum.mainModuleScreen;
          return false;
        },
        appBarEmulate: AppBarEmulate(title: "Learn process"),
      );
    } else if (moduleNavPr.buttonType ==
        ModuleButtonNavigationEnum.startLearn) {
      startLearning(termsPr, userPr);
      moduleNavPr.buttonType = ModuleButtonNavigationEnum.continueLearn;
      return Container();
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
      appBarEmulate: AppBarEmulate(title: "not init"),
    );
  }
}
