///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';

class choiceWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "module name",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xfff9f9f9),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xfff9f9f9),
          size: 24,
        ),
      ),
      body: Column(
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
                value: 0.1,
                minHeight: 3),
          ),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0x1f000000),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Слово 1",
                textAlign: TextAlign.center,
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
          MaterialButton(
            onPressed: () {},
            color: Color(0xffffffff),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Color(0xff808080), width: 1),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              "opt1",
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
          MaterialButton(
            onPressed: () {},
            color: Color(0xffffffff),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Color(0xff808080), width: 1),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              "opt2",
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
          MaterialButton(
            onPressed: () {},
            color: Color(0xffffffff),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Color(0xff808080), width: 1),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              "opt3",
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
          MaterialButton(
            onPressed: () {},
            color: Color(0xffffffff),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Color(0xff808080), width: 1),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              "opt4",
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
        ],
      ),
    );
  }
}
