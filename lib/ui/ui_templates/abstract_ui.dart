import 'package:flutter/cupertino.dart';

import '../../domain_layer/data_mixins/modules/modules.dart';
import '../../urils/db/abstract_entity.dart';
import '../../urils/db/dbMixins.dart';

abstract class AbstractUIStatelessWidget extends StatelessWidget
    implements GetDbData, OpenAndCloseI {
  AbstractUIStatelessWidget() {
  completionData();
  }
}

abstract class AbstractUIStatefulWidget<T extends StatefulWidget>
    extends State<T>
    implements GetDbData, OpenAndCloseI {
  AbstractUIStatefulWidget() {
    completionData();
  }

  @override
  void dispose() async {
    // streamSubscription?.cancel();
    // await IzarManager.instance.closeIsar((await _isar));
    super.dispose();
  }
}
