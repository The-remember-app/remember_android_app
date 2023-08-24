

import 'package:flutter/cupertino.dart';
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

class EmptyAppBar extends AbstractAppBar

{
  EmptyAppBar({required super.dfMapper});



  @override
  PreferredSizeWidget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      elevation: 4,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff3a57e8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: Text(
        dfMapper.appBarEmulate.title!,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          color: Color(0xfff9f9f9),
        ),
      ),
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: Color(0xfff9f9f9),
      //     size: 24,
      //   ),
      //   onPressed: onPressed,
      // ),
      // actions: [
      //   Icon(Icons.search, color: Color(0xffffffff), size: 22),
      //   Padding(
      //     padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      //     child: Icon(Icons.edit, color: Color(0xfff9f9f9), size: 24),
      //   ),
      // ],
    );
  }


}

class ArrowBackAppBar extends AbstractAppBar{
  ArrowBackAppBar({required super.dfMapper});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff3a57e8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: Text(
        dfMapper.appBarEmulate.title!,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          color: Color(0xfff9f9f9),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xfff9f9f9),
          size: 24,
        ),
        onPressed: () async {
          await dfMapper.appBarEmulate.arrowBackFunc!();
        },
      ),
      // actions: [
      //   Icon(Icons.search, color: Color(0xffffffff), size: 22),
      //   Padding(
      //     padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      //     child: Icon(Icons.edit, color: Color(0xfff9f9f9), size: 24),
      //   ),
      // ],
    );
  }

}

