

import 'package:flutter/material.dart';

class SkeletonWidget extends StatelessWidget{

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  const SkeletonWidget({this.appBar, required this.body, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: Color(0xffffffff),
    );
  }

}