
import 'dart:math';

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_remember/src/repositoris/db_data_source/sentence.dart';
import 'package:the_remember/src/repositoris/db_data_source/term_adding_info.dart';
import 'package:uuid/uuid.dart';

import '../../../api_package/lib/api_package.dart';
import '../../../main.dart';
import '../../urils/db/abstract_entity.dart';
import 'datetime_mark.dart';
import 'module.dart';

part 'term.g.dart';

// final Map<Uuid, TermEntityDbDS> words = TermEntityDbDS.getTestTerms();
abstract class LearnWriteEntity{
  @ignore
  Id get isarId;
  @ignore
  String get termUuid;
  @ignore
  String get targetWrite;
  @ignore
  TermEntityDbDS get termEntityInterface;


}


@JsonSerializable()
@collection
class TermEntityDbDS  extends AbstractEntity
implements LearnWriteEntity{
  @Name("id")
  @JsonKey(includeFromJson: false, includeToJson: false)
  Id get isarId => AbstractEntity.fastHash(complexIndex.join("")) ;
  // @Index(unique: true, replace: true, caseSensitive: false)
  @JsonKey(name: 'id')
  late String uuid;

  @Name("user_uuid")
  @JsonKey(name: 'user_id')
  late String userUuid;
  @Name("complex_index")
  @JsonKey(includeFromJson: false, includeToJson: false)
  @Index(unique: true, replace: true, caseSensitive: false)
  List<String> get complexIndex => [uuid, userUuid];
  late String term;
  late String definition;
  @Name("module_id")
  @JsonKey(name: 'module_id')
  late String moduleUuid;

  @Name("choose_error_counter")
  @JsonKey(name: 'choose_error_counter')
  late int _chooseErrorCounter;
  @Name("write_error_counter")
  @JsonKey(name: 'write_error_counter')
  late int _writeErrorCounter;
  @Name("choice_neg_error_counter")
  @JsonKey(name: 'choice_neg_error_counter')
  late int _choiceNegErrorCounter;
  @Name("watch_count")
  @JsonKey(name: 'watch_count')
  late int _watchCount ;

  @Name("created_at")
  @JsonKey(name: 'created_at')
  late DateTime createdAt ;
  @Name("updated_at")
  @JsonKey(name: 'updated_at')
  late DateTime  updatedAt;
  @Name("personal_created_at")
  @JsonKey(name: 'personal_created_at')
  late DateTime personalCreatedAt;
  @Name("personal_updated_at")
  @JsonKey(name: 'personal_updated_at')
  late DateTime personalUpdatedAt ;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @Name("learn_term_datetime_mark")
  late List<LearnTermDatetimeMark> learnTermDatetimeMark;

  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  late bool? _reverseWrite = null;
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  late bool? _reverseChoice = null;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final module = IsarLink<ModuleDbDS>();

  @Backlink(to: 'termEntity')
  @Name("adding_info_entity")
  @JsonKey(includeFromJson: false, includeToJson: false)
  final addInfoEntities = IsarLinks<TermAddingInfoDbDS>();

  @Backlink(to: 'termEntity')
  @Name("sentence_entities")
  @JsonKey(includeFromJson: false, includeToJson: false)
  final sentenceEntities = IsarLinks<SentenceDbDS>();

  @ignore
  @JsonKey(name: 'term_id', includeFromJson: true, includeToJson: true)
  String get _termUuid => this.uuid;


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
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get  maybeReverseTermWrite {
    return isTermReverseWrite() ? definition: term;
  }
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get  maybeReverseDefinitionWrite {
    return isTermReverseWrite() ? term : definition;
  }
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get  maybeReverseTermChoice {
    return isTermReverseChoice() ? definition: term;
  }
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get  maybeReverseDefinitionChoice {
    return isTermReverseChoice() ? term : definition;
  }

  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Set<String> get  maybeReverseTermWriteSet {
    return isTermReverseWrite() ? definitionSet : termSet;
  }
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Set<String> get  maybeReverseDefinitionWriteSet {
    return isTermReverseWrite() ? termSet : definitionSet;
  }
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Set<String> get  maybeReverseTermChoiceSet {
    return isTermReverseChoice() ? definitionSet : termSet;
  }
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Set<String> get  maybeReverseDefinitionChoiceSet {
    return isTermReverseChoice() ? termSet : definitionSet;
  }

  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Set<String> get  definitionSet {
    return {definition};
  }
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Set<String> get  termSet {
    return {term};
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
      ..choiceNegErrorCounter=data.choiceNegErrorCounter!.asNum.toInt()
      ..watchCount=data.watchCount!.asNum.toInt()
      ..createdAt=DateTime.parse(data.createdAt!.asString)
      ..updatedAt=DateTime.parse(data.updatedAt!.asString)
      ..personalCreatedAt=DateTime.parse(data.personalCreatedAt!.asString)
      ..personalUpdatedAt=DateTime.parse(data.personalUpdatedAt!.asString)
    ;
  }

  JsonObject toJson(){
    return JsonObject({for (var i in _$TermEntityDbDSToJson(this).entries) i.key : i.value});
  }
  Map<String, dynamic> toJsonAsMap(){
    return <String, dynamic>{for (var i in _$TermEntityDbDSToJson(this).entries) i.key : i.value};
  }
  List<dynamic> toJsonAsList(){
    return [for (var i in _$TermEntityDbDSToJson(this).entries) for(var ii in <dynamic>[i.key as dynamic, i.value]) ii];
  }

  PersonalizeTermDTO toDTOModel__(){
    final result = PersonalizeTermDTOBuilder()
      ..userId=JsonObject(userUuid)
      ..chooseErrorCounter=JsonObject(chooseErrorCounter)
      ..writeErrorCounter=JsonObject(writeErrorCounter)
      ..choiceNegErrorCounter=JsonObject(choiceNegErrorCounter)
      ..personalCreatedAt=JsonObject(personalCreatedAt)
      ..personalUpdatedAt=JsonObject(personalUpdatedAt)
      ..term=JsonObject(term)
      ..definition=JsonObject(definition)
      ..moduleId=JsonObject(moduleUuid)
      ..id=JsonObject(uuid)
      ..createdAt=JsonObject(createdAt)
      ..updatedAt=JsonObject(updatedAt)

    ;
    return result.build();
  }

  T toDTO<T>(){
    var jsonRes = toJsonAsList();
    var res = (standardSerializers.deserialize(jsonRes,
        specifiedType: FullType(T))
    as T);


    return res;
  }

  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  String get targetWrite => maybeReverseDefinitionWrite;

  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  String get termUuid => uuid;

  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  TermEntityDbDS get termEntityInterface => this;

  int get chooseErrorCounter => _chooseErrorCounter;
  int get writeErrorCounter => _writeErrorCounter;
  int get choiceNegErrorCounter => _choiceNegErrorCounter;
  int get watchCount => _watchCount;

  set chooseErrorCounter(int value){
    _chooseErrorCounter = max(value, 0);
  }
  set writeErrorCounter(int value){
    _writeErrorCounter = max(value, 0);
  }
  set choiceNegErrorCounter(int value){
    _choiceNegErrorCounter = max(value, 0);
  }
  set watchCount(int value){
    _watchCount = max(value, 0);
  }


}