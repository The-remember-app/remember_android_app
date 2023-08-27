

import 'package:flutter/material.dart';
import 'package:the_remember/src/ui/ui_templates/abstract_ui.dart';


abstract class AbstractAppBar extends StatelessWidget
    implements PreferredSizeWidget
{
  final DFMapper dfMapper;
  @override
  final Size preferredSize;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;

  AbstractAppBar({
    required this.dfMapper,
    this.toolbarHeight,
    this.bottom
  }):
        preferredSize = _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}