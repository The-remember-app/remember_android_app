import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/ui/ui_states/modules/learning/write_screen_choice.dart';

import '../../../../domain_layer/functions/words_BO.dart';
// import '../../../../domain_layer/providers/folders/module/learning/learning_navigation.dart';
// import '../../../../domain_layer/providers/folders/module/module_buttoons_navigation.dart';
// import '../../../../domain_layer/providers/folders/module/terms_in_module.dart';
import '../../../../domain_layer/providers/main/folders/module/learning/learning_navigation.dart';
import '../../../../domain_layer/providers/main/folders/module/module_buttoons_navigation.dart';
import '../../../../domain_layer/providers/main/folders/module/terms_in_module.dart';
import '../../../../domain_layer/providers/user_api_provider.dart';
import '../../../../repositoris/db_data_source/term.dart';
import '../../../pages/modules/learning/choiceWord.dart';
import '../../../pages/modules/learning/learn_finished.dart';
import '../../../ui_templates/abstract_ui.dart';

class LearnScreenProcessor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var termsPr = Provider.of<TermsInModuleProvider>(context, listen: false);
    return LearnScreenAddProfiler(termsPr: termsPr);
  }
}

class LearnScreenAddProfiler extends StatefulWidget {
  final TermsInModuleProvider termsPr;
  late List<TermEntityDbDS> currIterationTermsList;
  final List<TermEntityDbDS> changedTermsList = [];

  LearnScreenAddProfiler({super.key, required this.termsPr}) {

    currIterationTermsList = getOneLearnIterationList( termsPr.termsList!);

    termsPr.learningIterationTermsList = currIterationTermsList;
    termsPr.changedInLearningIterationTermsList = changedTermsList;
  }

  @override
  _LearnScreenAddProfilerState createState() => _LearnScreenAddProfilerState();
}

class _LearnScreenAddProfilerState
    extends AbstractUIStatefulWidget<LearnScreenAddProfiler> {
  @override
  Widget build(BuildContext context) {
    var userPr = Provider.of<UserApiProfile>(context, listen: false);
    var termsPr = Provider.of<TermsInModuleProvider>(context, listen: false);
    var modulePr = Provider.of<ModuleButtonNavigationProvider>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => LearnScreensNavigationProvider(userPr, termsPr, modulePr)),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: LearnScreenChoice(),
    );
  }
}

class LearnScreenChoice extends StatefulWidget {
  @override
  _LearnScreenChoiceState createState() => _LearnScreenChoiceState();
}

class _LearnScreenChoiceState
    extends AbstractUIStatefulWidget<LearnScreenChoice> {
  @override
  Widget build(BuildContext context) {
    var userPr = Provider.of<UserApiProfile>(context, listen: false);
    var termsPr = Provider.of<TermsInModuleProvider>(context, listen: false);
    var moduleNavPr =
        Provider.of<ModuleButtonNavigationProvider>(context, listen: false);
    return Consumer<LearnScreensNavigationProvider>(
        builder: (context, learnNavPr, child) {
      // Future _future = fmPr.
      return choiceNextScreen(
          context, userPr, moduleNavPr, termsPr, learnNavPr);
    });
  }

  Widget choiceNextScreen(
      BuildContext context,
      UserApiProfile userPr,
      // FolderAndModuleProvider fmPr,
      // BottomNavigationProvider bottomPagePr,
      // AppBarNavigationProvider appBarPagePr
      ModuleButtonNavigationProvider moduleNavPr,
      TermsInModuleProvider termsPr,
      LearnScreensNavigationProvider learnNavPr) {
    if (learnNavPr.learnNotStarted) {
      return Text(
          "Список терминов для текущей итерации не существует, это явно ошибка");
    } else if (learnNavPr.learnFinished) {
      learnTransactionCompleted(termsPr.changedInLearningIterationTermsList ?? [], userPr);
      return LearnCompleted();
    } else if (learnNavPr.iterationFinished) {
      learnTransactionCompleted(termsPr.changedInLearningIterationTermsList ?? [], userPr);
      moduleNavPr.buttonType = ModuleButtonNavigationEnum.mainModuleScreen;
      return  Container();
    } else {
      var currTerm =
          termsPr.learningIterationTermsList![learnNavPr.activePageNumber];
      if (currTerm.chooseErrorCounter == 0){
        return AddWriteScreenProvider(termsPr: termsPr, learnNavPr: learnNavPr);
      } else {
        return ChoiceWord(termsPr: termsPr, learnNavPr: learnNavPr);
      }
    }
    return Text("");
  }
}
