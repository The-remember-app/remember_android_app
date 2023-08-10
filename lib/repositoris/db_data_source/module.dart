

import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';
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
  late String rootFolderUuid;

  @Name("is_reverse_definition_write")
  late bool isReverseDefinitionWrite = false;
  @Name("standard_and_reverse_write")
  late bool standardAndReverseWrite = true;
  @Name("is_reverse_definition_choice")
  late bool isReverseDefinitionChoice = false;
  @Name("standard_and_reverse_choice")
  late bool standardAndReverseChoice = true;

  @Backlink(to: 'module')
  final words = IsarLinks<TermEntityDbDS>();
  @Name("root_folder")
  final rootFolder = IsarLink<FolderDbDS>();
}
