import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../../main.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../data_abstract.dart';
import '../../module_repository/local_db_data_source/module.dart';

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


@collection
class TermEntityDbDS  extends AbstractEntity  {
  Id id = Isar.autoIncrement;
  late String uuid;
  late String term;
  late String definition;
  late String module_id;
  late int choose_error_counter;
  late int write_error_counter;
  late int choise_neg_error_counter;
  late bool? _reverseWrite = null;
  late bool? _reverseChoice = null;

  final module = IsarLink<ModuleDbDS>();


  void updateReverseWrite(){
    _reverseChoice = null;
    _reverseWrite =   random.nextBool();
  }
  void updateReverseChoice(){
    _reverseChoice = random.nextBool();
    _reverseWrite =   null;
  }
  void  resetReverse(){
    _reverseChoice = null;
    _reverseWrite =   null;
  }

  // TermEntity(this.id, this.term, this.definition, this.module_id,
  //     this.choose_error_counter, this.write_error_counter,
  //     this.choise_neg_error_counter);
  //
  // TermEntity.test(String term, String definition, String module_id)
  //     : this(Uuid().toString(), term, definition, module_id, 0, 0, 0);

  static Map<Uuid, TermEntityDbDS> getTestTerms() {
    final Map<String, String> wordsSet = {
      "one": 'Один',
      "two": "два",
      "three": 'три',
      "four": "Четыре",
      "five": "Пять",
      "six": "шесть",
      "seven": "семь",
    };

    // final Map<Uuid, TermEntity> words = {
    //   for (var t in [
    //     for (var v in wordsSet.entries)
    //       for (var m in foldersOrModules.entries)
    //         if (m.value is Module) TermEntity()
    // ..term=v.key
    // ..definition=v.value
    // ..module_id= m.key;
    //   ])
    //     t.id: t
    // };
    final Map<Uuid, TermEntityDbDS> words = Map<Uuid, TermEntityDbDS>();
    return words;
  }

  bool isTermReverseWrite(){
    // var module = foldersOrModules[module_id];
    _reverseWrite ??=  random.nextBool();
    return module.value!.standart_and_reverce_write ? _reverseWrite! : module.value!.is_reverce_defitition_write;
  }
  bool isTermReverseChoice(){
    // var module = foldersOrModules[module_id];
    _reverseChoice ??= random.nextBool();
    return module.value!.standart_and_reverce_choice ? _reverseChoice! : module.value!.is_reverce_defitition_choice;
  }
  @ignore
  get  maybeReverseTermWrite {
    return isTermReverseWrite() ? definition: term;
  }
  @ignore
  get  maybeReverseDefinitionWrite {
    return isTermReverseWrite() ? term : definition;
  }
  @ignore
  get  maybeReverseTermChoice {
    return isTermReverseChoice() ? definition: term;
  }
  @ignore
  get  maybeReverseDefinitionChoice {
    return isTermReverseChoice() ? term : definition;
  }
}