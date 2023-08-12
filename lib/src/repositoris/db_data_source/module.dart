

import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';


import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';
import 'folder.dart';
import 'term.dart';


part 'module.g.dart';




  // Module.genId(name) : this(Uuid(), name);
  //
  // Module(this.id, this.name);

@collection
class ModuleDbDS  extends AbstractEntity {
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(uuid) ;
  @Index(unique: true, replace: true, caseSensitive: false)
  late String uuid;
  late String name;
  @Name("root_folder_uuid")
  late String? rootFolderUuid;

  @Name("is_reverse_definition_write")
  late bool isReverseDefinitionWrite = false;
  @Name("standard_and_reverse_write")
  late bool standardAndReverseWrite = true;
  @Name("is_reverse_definition_choice")
  late bool isReverseDefinitionChoice = false;
  @Name("standard_and_reverse_choice")
  late bool standardAndReverseChoice = true;
  @Name("personal_created_at")
  late DateTime personalUpdatedAt;
  @Name("personal_updated_at")
  late DateTime personalCreatedAt;

  @Backlink(to: 'module')
  final words = IsarLinks<TermEntityDbDS>();
  @Name("root_folder")
  final rootFolder = IsarLink<FolderDbDS>();

  static ModuleDbDS fromJson(PersonalizeModuleDTO data){

    return ModuleDbDS()
      ..uuid=data.id!.asString
      ..name=data.name!.asString
      ..rootFolderUuid=data.rootFolderId?.asString
      ..isReverseDefinitionWrite=data.isReverseDefinitionWrite!.asBool
      ..standardAndReverseWrite=data.standardAndReverseWrite!.asBool
      ..isReverseDefinitionChoice=data.isReverseDefinitionChoice!.asBool
      ..standardAndReverseChoice=data.standardAndReverseChoice!.asBool
    ;
  }
}
