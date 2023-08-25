import 'package:isar/isar.dart';

import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../repositoris/db_data_source/term.dart';
import '../../../ui/pages/modules/unary_module.dart';
import '../../../ui/ui_templates/abstract_ui.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../../urils/db/dbMixins.dart';
import '../../../urils/db/engine.dart';


abstract class UnaryModuleStateI {
  late ModuleDbDS currentModuleEntity;
// UnaryFolderI(this.folderId);
}

mixin UnaryModuleStateDbMixin
    implements
        OpenAndClose3<
            CollectionSchema<TermEntityDbDS>,
            CollectionSchema<ModuleDbDS>,
            CollectionSchema<AbstractEntity>
        >,
        UnaryModuleStateI,
        AbstractUIStatefulWidget<UnaryModule>,
        GetDataFromDbI {
  // late ModuleDbDS currentModuleEntity;
  late List<TermEntityDbDS> currentTerms = [];
  late FolderDbDS? rootFolder = null;

  @override
  void completionData() async {
    await openConn();
    currentModuleEntity = currentModuleEntity;
    currentTerms = (await conn[ConnType.term]!
        .collection<TermEntityDbDS>()
    // .verifyLink(linkName, sourceIds, targetIds)
        .filter()
        .module((q) => q.isarIdEqualTo(currentModuleEntity.isarId))

        .findAll());
    if (currentModuleEntity.rootFolderUuid != null){
      rootFolder = (await conn[ConnType.term]!
          .collection<FolderDbDS>()
          // .getByUuid(currentModuleEntity.rootFolderUuid!)
          .getByComplexIndex([currentModuleEntity.rootFolderUuid!, currentModuleEntity.userUuid])
      );
    }
    await closeConn();

    this.setState(() => null);
    // closeConn();
  }

  @override
  void dispose() async {
    // TODO: implement dispose


    // super.dispose();
  }
}
