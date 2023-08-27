///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/ui/pages/modules/learning/progress_bar.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain_layer/functions/words_BO.dart';
// import '../../../../domain_layer/providers/folders/module/learning/learning_navigation.dart';
// import '../../../../domain_layer/providers/folders/module/terms_in_module.dart';
// import '../../../../domain_layer/providers/folders/module/learning/write/write_word_navigation.dart';
import '../../../../domain_layer/providers/main/folders/module/learning/learning_navigation.dart';
import '../../../../domain_layer/providers/main/folders/module/learning/write/write_word_navigation.dart';
import '../../../../domain_layer/providers/main/folders/module/terms_in_module.dart';
import '../../../../repositoris/db_data_source/term.dart';
import '../../../ui_templates/abstract_ui.dart';

void changeWordStatus(Uuid wordId, bool) {}

class WriteWord extends StatefulWidget {
  final TermsInModuleProvider termsPr;
  final LearnScreensNavigationProvider learnNavPr;
  late TermEntityDbDS wordEntity;
  late int progress;
  late int maxProgress;
  late bool reverseTerm;
  String inputWord = "";

  WriteWord({
    required this.termsPr,
    required this.learnNavPr,
  }) {
    progress = learnNavPr.activePageNumber;
    maxProgress = termsPr.learningIterationTermsList!.length;
    wordEntity = termsPr.learningIterationTermsList![progress];
    reverseTerm = wordEntity.isTermReverseChoice();
  }

  @override
  _WriteWordState createState() => _WriteWordState();
}

class _WriteWordState extends AbstractUIStatefulWidget<WriteWord> {
  bool nextScreen = false;
  @override
  Widget build(BuildContext context) {
    // var moduleEntity = foldersOrModules[moduleId];
    // var wordEntity = words[wordId];
    // var learnNavPr = Provider.of<LearnScreensNavigationProvider>(context, listen: false);
    var termsPr = Provider.of<TermsInModuleProvider>(context, listen: false);

    var learnNavPr =
    Provider.of<LearnScreensNavigationProvider>(context, listen: false);
    var writeLearnNavPr = Provider.of<WriteWordNavigationProvider>(context, listen: false);
    return GestureDetector(
      onPanUpdate: (details) async {

        // Swiping in right direction.
        if (details.delta.dx > 0) {}

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          if (!nextScreen) {
            writeLearnNavPr.writtenWord = widget.inputWord;
            nextScreen = true;
          }
          // if (buttonPressed.values.any((isClicked) => isClicked)) {
          // var nextPage = await getNextLearnPage(moduleEntity,
          //     currTermList: currTermsList,
          //     progress: progress,
          //     InputedWord: inputWord,
          //     showPostScreen: true,
          //     context: context);
          // await nextPage(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => nextPage));
          // }
        }

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          LearnProgressBarWidget(),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0x00000000),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Введите слово:",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        (widget.wordEntity.maybeReverseTermWrite ??
                            "Не найдено термина с таким UUID")+ " " + (learnNavPr.activePageNumber.toString() + " / " +  termsPr.learningIterationTermsList!.length.toString()),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (text) async {
                widget.inputWord = text;
                if (text.toLowerCase() ==
                    widget.wordEntity.maybeReverseDefinitionWrite.toLowerCase()) {
                  writeWordChanging(widget.wordEntity, widget.inputWord, widget.termsPr.termsList!, widget.termsPr);
                  learnNavPr.activePageNumber += 1;
                  // words[wordId]?.write_error_counter -= 1;
                  // var nextPage = await getNextLearnPage(
                  //   moduleEntity,
                  //   currTermList: currTermsList,
                  //   progress: progress,
                  //   InputedWord: inputWord,
                  //   showPostScreen: false,
                  //   context: context,
                  // );
                  // await nextPage(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => nextPage));
                }
                // print("onChanged");
                // print("Введенный текст: $text");
              },
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff000000),
              ),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xff000000), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xff000000), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Color(0xff000000), width: 1),
                ),
                labelText: "Введите значение темина",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                hintText: "Начните вводить",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                filled: true,
                fillColor: Color(0xfff2f2f3),
                isDense: false,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                prefixIcon:
                    Icon(Icons.edit, color: Color(0xff212435), size: 24),
              ),
              autofocus: true,
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      "Для того, чтобы перейти к следующему термину проведите пальцем по экрану от правого края к левому или просто нажмите на кнопку",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                        color: Color(0xff707070),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        onPressed: () async {
                          writeLearnNavPr.writtenWord = widget.inputWord;
                          // var nextPage = await getNextLearnPage(
                          //   moduleEntity,
                          //   currTermList: currTermsList,
                          //   progress: progress,
                          //   InputedWord: inputWord,
                          //   showPostScreen: true,
                          //   context: context,
                          // );
                          // await nextPage(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => nextPage));
                        },
                        color: Color(0xfff9f9f9),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Color(0xff3a57e8), width: 2),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "К следующему термину",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xff000000),
                        height: 40,
                        minWidth: 140,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
