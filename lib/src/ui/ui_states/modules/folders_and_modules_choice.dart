import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/ui/ui_states/modules/unary_module.dart';

import '../../../domain_layer/providers/app_bar_navigation.dart';
import '../../../domain_layer/providers/bottom_navigation_provider.dart';
import '../../../domain_layer/providers/folder_module.dart';
import '../../../domain_layer/providers/user_api_provider.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../pages/modules/modules.dart';
import '../../pages/modules/unary_folder.dart';
import '../../pages/modules/unary_module.dart';
import '../../ui_templates/abstract_ui.dart';
import '../../ui_templates/navigation/app_bar_navigation_enum.dart';
import '../main_content.dart';

class FoldersAndModulesProcessor extends StatelessWidget {
  final DFMapper dfMapper;

  const FoldersAndModulesProcessor({super.key, required this.dfMapper});

  @override
  Widget build(BuildContext context) {
    var userPr = Provider.of<UserApiProfile>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => FolderAndModuleProvider(userPr: userPr)),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: FolderOrModuleChoice(dfMapper: dfMapper),
    );
  }
}

class FolderOrModuleChoice extends StatefulWidget {
  final DFMapper dfMapper;

  const FolderOrModuleChoice({super.key, required this.dfMapper});

  @override
  _FolderOrModuleChoiceState createState() => _FolderOrModuleChoiceState();
}

class _FolderOrModuleChoiceState
    extends AbstractUIStatefulWidget<FolderOrModuleChoice> {
  @override
  Widget build(BuildContext context) {
    var bottomPagePr =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    var appBarPagePr =
        Provider.of<AppBarNavigationProvider>(context, listen: false);
    return Consumer<FolderAndModuleProvider>(builder: (context, fmPr, child) {
      // Future _future = fmPr.
      return choiceNextScreen(context, fmPr, bottomPagePr, appBarPagePr);
    });
  }

  Widget choiceNextScreen(
      BuildContext context,
      FolderAndModuleProvider fmPr,
      BottomNavigationProvider bottomPagePr,
      AppBarNavigationProvider appBarPagePr) {
    if (fmPr.currentModule == null) {
      return Wapper(
        appBar: appBarPagePr.getAppBarWidget[fmPr.currentFolder == null
            ? AppBarNavigationEnum.empty
            : AppBarNavigationEnum.arrowBack]!(context, widget.dfMapper),
        body: UnaryFolder( dfMapper: widget.dfMapper),
        bottomNavigationBar: bottomPagePr.bottomNavWidget!(context),
        dfMapper: widget.dfMapper,
        onWillPop: () async {
          fmPr.currentFolder = fmPr.rootFolder;
          return false;
        },
        appBarEmulate:
            AppBarEmulate(title: fmPr.currentFolder?.name ?? "Root folder"),
      );
    } else {
      return  ModuleWithTerms(dfMapper: widget.dfMapper);
    }
  }
}

// class AwaitFolderAndModules extends StatefulWidget {
//   @override
//   _AwaitFolderAndModulesState createState() => _AwaitFolderAndModulesState();
// }
//
// class _AwaitFolderAndModulesState
//     extends AbstractUIStatefulWidget<AwaitFolderAndModules> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FolderAndModuleProvider>(builder: (context, fmPr, child) {
//       // Future _future = fmPr.
//     });
//   }
// }
