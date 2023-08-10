

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
  Id id = Isar.autoIncrement;
  late String uuid;
  late String name;

  late bool is_reverce_defitition_write = false;
  late bool standart_and_reverce_write = true;
  late bool is_reverce_defitition_choice = false;
  late bool standart_and_reverce_choice = true;

  @Backlink(to: 'module')
  final words = IsarLinks<TermEntityDbDS>();
  final root_folder = IsarLink<FolderDbDS>();
}
