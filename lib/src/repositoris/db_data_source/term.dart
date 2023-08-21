
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';


import '../../../api_package/lib/api_package.dart';
import '../../../main.dart';
import '../../urils/db/abstract_entity.dart';
import 'folder.dart';
import 'module.dart';

part 'term.g.dart';

// final Map<Uuid, TermEntityDbDS> words = TermEntityDbDS.getTestTerms();


@collection
class TermEntityDbDS  extends AbstractEntity  {
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(uuid) ;
  // @Index(unique: true, replace: true, caseSensitive: false)
  late String uuid;
  @Name("user_uuid")
  late String userUuid;
  @Name("complex_index")
  @Index(unique: true, replace: true, caseSensitive: false)
  List<String> get complexIndex => [uuid, userUuid];
  late String term;
  late String definition;
  @Name("module_uuid")
  late String moduleUuid;
  @Name("choose_error_counter")
  late int chooseErrorCounter;
  @Name("write_error_counter")
  late int writeErrorCounter;
  @Name("choice_neg_error_counter")
  late int choisceNegErrorCounter;

  @Name("created_at")
  late DateTime createdAt ;
  @Name("updated_at")
  late DateTime  updatedAt;
  @Name("personal_created_at")
  late DateTime personalCreatedAt;
  @Name("personal_updated_at")
  late DateTime personalUpdatedAt ;

  @ignore
  late bool? _reverseWrite = null;
  @ignore
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
    return module.value!.standardAndReverseWrite ? _reverseWrite! : module.value!.isReverseDefinitionWrite;
  }
  bool isTermReverseChoice(){
    // var module = foldersOrModules[module_id];
    _reverseChoice ??= random.nextBool();
    return module.value!.standardAndReverseChoice ? _reverseChoice! : module.value!.isReverseDefinitionChoice;
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

  static TermEntityDbDS fromJson(PersonalizeTermDTO data){

    return TermEntityDbDS()
      ..uuid=data.id!.asString
      ..userUuid=data.userId!.asString
      ..term=data.term!.asString
      ..definition=data.definition!.asString
      ..moduleUuid=data.moduleId!.asString
      ..chooseErrorCounter=data.chooseErrorCounter!.asNum.toInt()
      ..writeErrorCounter=data.writeErrorCounter!.asNum.toInt()
      ..choisceNegErrorCounter=data.choiceNegErrorCounter!.asNum.toInt()
      ..createdAt=DateTime.parse(data.createdAt!.asString)
      ..updatedAt=DateTime.parse(data.updatedAt!.asString)
      ..personalCreatedAt=DateTime.parse(data.personalCreatedAt!.asString)
      ..personalUpdatedAt=DateTime.parse(data.personalUpdatedAt!.asString)
    ;
  }
}