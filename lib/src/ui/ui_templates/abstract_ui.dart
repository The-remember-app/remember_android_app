import 'package:flutter/cupertino.dart';

import '../../urils/db/abstract_entity.dart';
import '../../urils/db/dbMixins.dart';
import '../ui_states/main_content.dart';

abstract class AbstractUIStatelessWidget extends StatelessWidget
    implements GetDbData, OpenAndCloseI {
  AbstractUIStatelessWidget() {
  completionData();
  }
}

abstract class AbstractUIStatefulWidget<T extends StatefulWidget>
    extends State<T>
    // implements GetDbData, OpenAndCloseI
{
  AbstractUIStatefulWidget() {
    // completionData();
  }

  @override
  void dispose() async {
    // streamSubscription?.cancel();
    // await IzarManager.instance.closeIsar((await _isar));
    super.dispose();
  }
}



class DFMapper{
  late Future<bool> Function() onWillPop;
  late AppBarEmulate appBarEmulate;
}