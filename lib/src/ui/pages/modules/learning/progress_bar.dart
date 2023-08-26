

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain_layer/providers/learning_navigation.dart';
import '../../../../domain_layer/providers/terms_in_module.dart';

class LearnProgressBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var learnNavPr = Provider.of<LearnScreensNavigationProvider>(context, listen: false);
    var termsPr = Provider.of<TermsInModuleProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: LinearProgressIndicator(
          backgroundColor: Color(0xff808080),
          valueColor:
          new AlwaysStoppedAnimation<Color>(Color(0xff3a57e8)),
          value: learnNavPr.activePageNumber.toDouble() / termsPr.learningIterationTermsList!.length.toDouble(),
          minHeight: 3),
    );
  }

}