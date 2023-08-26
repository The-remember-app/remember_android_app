
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../domain_layer/providers/learning_navigation.dart';
import '../../../../domain_layer/providers/terms_in_module.dart';
import '../../../../domain_layer/providers/write_word_navigation.dart';
import '../../../pages/modules/learning/writeWord.dart';
import '../../../pages/modules/learning/writeWordOneMoreTime.dart';
import '../../../ui_templates/abstract_ui.dart';

class AddWriteScreenProvider extends StatelessWidget{
  final TermsInModuleProvider termsPr;
  final LearnScreensNavigationProvider learnNavPr;

  AddWriteScreenProvider({
    required this.termsPr,
    required this.learnNavPr,
  });

  @override
  Widget build(BuildContext context) {
    var progress = learnNavPr.activePageNumber;
    var wordEntity = termsPr.learningIterationTermsList![progress];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => WriteWordNavigationProvider(wordEntity)),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: WriteScreenChoice(termsPr: termsPr, learnNavPr: learnNavPr),
    );
  }
}

class WriteScreenChoice extends StatefulWidget{
  final TermsInModuleProvider termsPr;
  final LearnScreensNavigationProvider learnNavPr;

  WriteScreenChoice({
    required this.termsPr,
    required this.learnNavPr,
  });

  @override
  _WriteScreenChoiceState createState() => _WriteScreenChoiceState();
}

class _WriteScreenChoiceState extends AbstractUIStatefulWidget<WriteScreenChoice> {
  @override
  Widget build(BuildContext context) {
    // var bottomPagePr =
    // Provider.of<BottomNavigationProvider>(context, listen: false);
    // var appBarPagePr =
    // Provider.of<AppBarNavigationProvider>(context, listen: false);
    return Consumer<WriteWordNavigationProvider>(builder: (context, writeWordPr, child) {
      // Future _future = fmPr.
      return choiceNextScreen(context, writeWordPr);
    });
  }

  Widget choiceNextScreen(
      BuildContext context,
      // FolderAndModuleProvider fmPr,
      // BottomNavigationProvider bottomPagePr,
      // AppBarNavigationProvider appBarPagePr
      WriteWordNavigationProvider writeWordPr,
      ) {
    if (writeWordPr.writtenWord == null) {
      return WriteWord(termsPr: widget.termsPr, learnNavPr: widget.learnNavPr);
    } else {
      return WriteWordOneMoreTime(termsPr: widget.termsPr, learnNavPr: widget.learnNavPr);
    }
  }
}