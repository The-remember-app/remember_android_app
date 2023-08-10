
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';
import '../../urils/db/abstract_entity.dart';
import 'folder.dart';
import 'module.dart';

part 'term.g.dart';

// final Map<Uuid, TermEntityDbDS> words = TermEntityDbDS.getTestTerms();


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