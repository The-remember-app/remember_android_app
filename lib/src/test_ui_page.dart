///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import 'package:the_remember/src/ui/ui_templates/pages/main/folders/module/learn/write_field_template.dart';

// aaaaaaaaaa 150
// aaaa 100
class TestUiPage extends StatelessWidget {
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
            TermEntityDbDS()
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
