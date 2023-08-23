///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';

import '../../../../repositoris/db_data_source/folder.dart';
import '../../../../repositoris/db_data_source/module.dart';
import '../../../../repositoris/db_data_source/term.dart';
import '../unary_module.dart';


class WriteWordOneMoreTime extends StatelessWidget {
  final ModuleDbDS moduleEntity;
  final TermEntityDbDS wordEntity;
  final int progress;
  final int maxProgress;
  List<TermEntityDbDS>? currTermsList;
  final String userInput;

  final bool reverseTerm;

  WriteWordOneMoreTime(this.moduleEntity, this.wordEntity, this.progress,
      this.maxProgress,
      [this.currTermsList = null,
        this.userInput = "",
        this.reverseTerm = false]);

  @override
  Widget build(BuildContext context) {
    // var moduleEntity = foldersOrModules[moduleEntity];
    // var wordEntity = words[wordId];
    return WillPopScope(
      child:Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
          elevation: 4,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff3a57e8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: Text(
            moduleEntity.name ?? "Не найден Uuid для этого модуля",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xfff9f9f9),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xfff9f9f9),
              size: 24,
            ), onPressed: () {
            Navigator.pushNamed(
              context,
              '/module_id',
              arguments: {
                'moduleId': moduleEntity,
              },
            );
            // Navigator.pop(context);


          },
          ),
      ),
      body: GestureDetector(
        onPanUpdate: (details) async {
          // Swiping in right direction.
          if (details.delta.dx > 0) {}

          // Swiping in left direction.
          if (details.delta.dx < 0) {
            // if (buttonPressed.values.any((isClicked) => isClicked)) {
            var nextPage = await getNextLearnPage(
                moduleEntity,
                currTermList: currTermsList,
                progress: progress,
                InputedWord: userInput,
                showPostScreen: false,
              context: context,
            );

            await nextPage(context);


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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: LinearProgressIndicator(
                  backgroundColor: Color(0xff808080),
                  valueColor:
                  new AlwaysStoppedAnimation<Color>(Color(0xff3a57e8)),
                  value: progress.toDouble() / maxProgress.toDouble(),
                  minHeight: 3),
            ),
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 200,
              height: 250,
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Попробуйте снова!",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Color(0xffff9678),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Введите значение термина:",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  wordEntity.maybeReverseTermWrite ??
                                      "Похоже, что по этому Uuid не найдено термина, так быть не должно...",
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Повторите:",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                wordEntity.maybeReverseDefinitionWrite ??
                                    "Похоже, что по этому Uuid не найдено термина, так быть не должно...",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 24,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) async {
                  // UserInput = text;
                  if (text.toLowerCase() ==
                      wordEntity.maybeReverseDefinitionWrite.toLowerCase()) {
                    // words[wordId]?.write_error_counter -= 1;
                    var nextPage = await getNextLearnPage(
                        moduleEntity,
                        currTermList: currTermsList,
                        progress: progress,
                      InputedWord: userInput,
                      showPostScreen: false,
                      context: context,
                    );

                    await nextPage(context);
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
                  labelText: "Попробуйте ещё раз ввести значение темина",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  hintText: wordEntity.maybeReverseDefinitionWrite ??
                      "Похоже, что по этому Uuid не найдено термина, так быть не должно...",
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
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Для того, чтобы пропустить повторный ввод (что может плохо сказаться на обучении) перейти к следующему термину проведите пальцем по экрану от правого края к левому или просто нажмите на кнопку",
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
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      child: Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          onPressed: () async {
                            var nextPage = await getNextLearnPage(
                                moduleEntity,
                                currTermList: currTermsList,
                                progress: progress,
                              InputedWord: userInput,
                              showPostScreen: false,
                              context: context,
                            );
                            await nextPage(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => nextPage ));
                          },
                          color: Color(0xfff9f9f9),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side:
                            BorderSide(color: Color(0xff3a57e8), width: 2),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Пропустить ввод термина",
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      child: Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          onPressed: () async {
                            var nextPage = await getNextLearnPage(
                                moduleEntity,
                                currTermList:  currTermsList,
                                progress: progress,
                                InputedWord: wordEntity.maybeReverseDefinitionWrite,
                                showPostScreen: false,
                              context: context,
                            );
                            await nextPage(context);

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => nextPage ));
                          },
                          color: Color(0xfff9f9f9),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side:
                            BorderSide(color: Color(0xff3a57e8), width: 2),
                          ),
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            "Я ответил верно, это очепятка",
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
      ),
    ),
    onWillPop: () async {
      var nextPage = await getNextLearnPage(
          moduleEntity,
          currTermList: currTermsList,
          progress: currTermsList!.length,
          context: context

      );
      await nextPage(context);
    return false;
    },
    );
  }
}
