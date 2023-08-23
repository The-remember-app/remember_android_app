import 'package:flutter/cupertino.dart';

class StatefulOnInitWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  final Function(Widget, BuildContext) beforeBuild;

  const StatefulOnInitWrapper({required this.onInit, required this.beforeBuild, required this.child});

  @override
  _StatefulOnInitWrapperState createState() => _StatefulOnInitWrapperState();
}

class _StatefulOnInitWrapperState extends State<StatefulOnInitWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.beforeBuild != null) {
      widget.beforeBuild(widget.child, context);
    }
    return widget.child;
  }
}
