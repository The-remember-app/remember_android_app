import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';
import '../../urils/db/abstract_entity.dart';
import 'module.dart';

part 'folder.g.dart';

@collection
class FolderDbDS extends AbstractEntity {
  Id id = Isar.autoIncrement;
  late String uuid;
  late String name;
  late String? root_folder_uuid;

  @Backlink(to: 'root_folder')
  final modules = IsarLinks<ModuleDbDS>();
  @Backlink(to: 'root_folder')
  final folders = IsarLinks<FolderDbDS>();
  final IsarLink<FolderDbDS> root_folder = IsarLink<FolderDbDS>();

// Folder.genId(name) : this(Uuid(), name);
//
// Folder(this.id, this.name);
}




