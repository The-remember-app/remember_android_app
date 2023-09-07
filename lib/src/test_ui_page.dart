///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import 'package:the_remember/src/ui/ui_templates/abstract_ui.dart';
import 'package:the_remember/src/ui/ui_templates/pages/main/folders/module/learn/write_field_template.dart';
import 'package:the_remember/src/urils/db/dbMixins.dart';

import 'domain_layer/providers/main/folders/folder_module.dart';
import 'domain_layer/providers/main/folders/module/learning/choice/choice_buttons_in_learn_screen.dart';
import 'domain_layer/providers/main/folders/module/learning/learning_navigation.dart';
import 'domain_layer/providers/main/folders/module/learning/write/write_word_navigation.dart';
import 'domain_layer/providers/main/folders/module/module_buttoons_navigation.dart';
import 'domain_layer/providers/main/folders/module/terms_in_module.dart';
import 'domain_layer/providers/user_api_provider.dart';


class UITestScreenAwaitData extends StatefulWidget
    with OpenAndClose {
  late Future<TermEntityDbDS?> termGetter;
  late TermEntityDbDS currTerm;
  bool userGetterCompleted = false;
  // final Future Function(UITestScreenAwaitData, BuildContext) awaitUserFunc;
  bool termIsLoaded = false;

  UITestScreenAwaitData() : super() {
    termGetter = awaitFunc();
  }

  Future<TermEntityDbDS> awaitFunc() async {
    var isar = await openConn();
    var terms = await isar
        .collection<TermEntityDbDS>()
        .filter()
        .uuidEqualTo("0a89595a-ca91-4f0d-bb3e-1299520c2cce")
        .findAll();
    // await closeConn();
    await terms[0].sentenceEntities.load();
    await terms[0].addInfoEntities.load();
    await terms[0].module.load();
    await closeConn();
    currTerm =  terms[0];
    return terms[0];
  }

  @override
  _UITestScreenAwaitDataState createState() => _UITestScreenAwaitDataState();
}


class _UITestScreenAwaitDataState
    extends AbstractUIStatefulWidget<UITestScreenAwaitData> {

  Future get termGetter => this.widget.termGetter;

  _UITestScreenAwaitDataState() : super();

  @override
  Widget build(BuildContext context) {
    // if (dbWorkCompleted && dbWorkCallback != null) {
    //   dbWorkCallback!(context);
    // }


    String? lastRoute = null;
    return
      FutureBuilder<TermEntityDbDS?>(
        future: termGetter.then((value) async {
          if (!widget.termIsLoaded) {
            widget.termIsLoaded = true;
          setState(() {
            return null;
          });
        }
      }),
        builder: (context, AsyncSnapshot<TermEntityDbDS?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              return Text(snapshot.error.toString());
            }
            return PrConsAdd(child: TestUiPage(widget.currTerm));
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: Container(),
            );
          }
        },
        // )
      );
  }

}


class  PrConsAdd extends StatelessWidget{

  final Widget child;

  const PrConsAdd({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var userPr = Provider.of<UserApiProfile>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => FolderAndModuleProvider(userPr: userPr)),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => TermsInModuleProvider(
                  fmPr:  Provider.of<FolderAndModuleProvider>(context, listen: false)
              )),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => ModuleButtonNavigationProvider(
                    Provider.of<TermsInModuleProvider>(context, listen: false),
                    userPr)),
          ],
          child:   MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context) => LearnScreensNavigationProvider(
                      userPr,
                      Provider.of<TermsInModuleProvider>(context, listen: false),
                      Provider.of<ModuleButtonNavigationProvider>(context, listen: false)
                  )),
              // Provider(create: (context) => SomeOtherClass()),
            ],
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (context) => WriteWordNavigationProvider(
                        Provider.of<TermsInModuleProvider>(context, listen: false),
                        Provider.of<LearnScreensNavigationProvider>(context, listen: false)
                    )
                ),
                // Provider(create: (context) => SomeOtherClass()),
              ],
              child: child,
            ),
          ),
        ),
      ),
    );




  }

}


class TestUiPage extends StatelessWidget {

  final TermEntityDbDS currTerm;

  const TestUiPage(  this.currTerm);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: LinearProgressIndicator(
              backgroundColor: Color(0xff808080),
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff3a57e8)),
              value: 0.1,
              minHeight: 3),
        ),
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
                      "Слово 1",
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
        WriteFieldInLearnModTemplate(
          currTerm, <TermEntityDbDS>[],
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
                      onPressed: () {},
                      color: Color(0xfff9f9f9),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Color(0xff3a57e8), width: 2),
                      ),
                      padding: EdgeInsets.all(16),
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
    );
  }
}
