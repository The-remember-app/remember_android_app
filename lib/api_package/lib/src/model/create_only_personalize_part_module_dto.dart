//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_only_personalize_part_module_dto.g.dart';

/// CreateOnlyPersonalizePartModuleDTO
///
/// Properties:
/// * [isReverseDefinitionWrite]
/// * [standardAndReverseWrite]
/// * [isReverseDefinitionChoice]
/// * [standardAndReverseChoice]
/// * [maxIterationLen]
/// * [minIterationLen]
/// * [minWatchCount]
/// * [knownTermPart]
/// * [choicesCount]
/// * [isLearnt]
/// * [moduleId]
/// * [rootFolderId]
@BuiltValue()
abstract class CreateOnlyPersonalizePartModuleDTO implements Built<CreateOnlyPersonalizePartModuleDTO, CreateOnlyPersonalizePartModuleDTOBuilder> {
  @BuiltValueField(wireName: r'is_reverse_definition_write')
  JsonObject? get isReverseDefinitionWrite;

  @BuiltValueField(wireName: r'standard_and_reverse_write')
  JsonObject? get standardAndReverseWrite;

  @BuiltValueField(wireName: r'is_reverse_definition_choice')
  JsonObject? get isReverseDefinitionChoice;

  @BuiltValueField(wireName: r'standard_and_reverse_choice')
  JsonObject? get standardAndReverseChoice;

  @BuiltValueField(wireName: r'max_iteration_len')
  JsonObject? get maxIterationLen;

  @BuiltValueField(wireName: r'min_iteration_len')
  JsonObject? get minIterationLen;

  @BuiltValueField(wireName: r'min_watch_count')
  JsonObject? get minWatchCount;

  @BuiltValueField(wireName: r'known_term_part')
  JsonObject? get knownTermPart;

  @BuiltValueField(wireName: r'choices_count')
  JsonObject? get choicesCount;

  @BuiltValueField(wireName: r'is_learnt')
  JsonObject? get isLearnt;

  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

  @BuiltValueField(wireName: r'root_folder_id')
  JsonObject? get rootFolderId;

  CreateOnlyPersonalizePartModuleDTO._();

  factory CreateOnlyPersonalizePartModuleDTO([void updates(CreateOnlyPersonalizePartModuleDTOBuilder b)]) = _$CreateOnlyPersonalizePartModuleDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateOnlyPersonalizePartModuleDTOBuilder b) => b
      ..isReverseDefinitionWrite = JsonObject(false)
      ..standardAndReverseWrite = JsonObject(false)
      ..isReverseDefinitionChoice =JsonObject (true)
      ..standardAndReverseChoice = JsonObject(false)
      ..maxIterationLen = JsonObject(10)
      ..minIterationLen = JsonObject(4)
      ..minWatchCount = JsonObject(5)
      ..knownTermPart = JsonObject(30)
      ..choicesCount = JsonObject(2)
      ..isLearnt = JsonObject(false);

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateOnlyPersonalizePartModuleDTO> get serializer => _$CreateOnlyPersonalizePartModuleDTOSerializer();
}

class _$CreateOnlyPersonalizePartModuleDTOSerializer implements PrimitiveSerializer<CreateOnlyPersonalizePartModuleDTO> {
  @override
  final Iterable<Type> types = const [CreateOnlyPersonalizePartModuleDTO, _$CreateOnlyPersonalizePartModuleDTO];

  @override
  final String wireName = r'CreateOnlyPersonalizePartModuleDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateOnlyPersonalizePartModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.isReverseDefinitionWrite != null) {
      yield r'is_reverse_definition_write';
      yield serializers.serialize(
        object.isReverseDefinitionWrite,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.standardAndReverseWrite != null) {
      yield r'standard_and_reverse_write';
      yield serializers.serialize(
        object.standardAndReverseWrite,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.isReverseDefinitionChoice != null) {
      yield r'is_reverse_definition_choice';
      yield serializers.serialize(
        object.isReverseDefinitionChoice,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.standardAndReverseChoice != null) {
      yield r'standard_and_reverse_choice';
      yield serializers.serialize(
        object.standardAndReverseChoice,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.maxIterationLen != null) {
      yield r'max_iteration_len';
      yield serializers.serialize(
        object.maxIterationLen,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.minIterationLen != null) {
      yield r'min_iteration_len';
      yield serializers.serialize(
        object.minIterationLen,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.minWatchCount != null) {
      yield r'min_watch_count';
      yield serializers.serialize(
        object.minWatchCount,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.knownTermPart != null) {
      yield r'known_term_part';
      yield serializers.serialize(
        object.knownTermPart,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.choicesCount != null) {
      yield r'choices_count';
      yield serializers.serialize(
        object.choicesCount,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.isLearnt != null) {
      yield r'is_learnt';
      yield serializers.serialize(
        object.isLearnt,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    yield r'module_id';
    yield object.moduleId == null ? null : serializers.serialize(
      object.moduleId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'root_folder_id';
    yield object.rootFolderId == null ? null : serializers.serialize(
      object.rootFolderId,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateOnlyPersonalizePartModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateOnlyPersonalizePartModuleDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'is_reverse_definition_write':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.isReverseDefinitionWrite = valueDes;
          break;
        case r'standard_and_reverse_write':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.standardAndReverseWrite = valueDes;
          break;
        case r'is_reverse_definition_choice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.isReverseDefinitionChoice = valueDes;
          break;
        case r'standard_and_reverse_choice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.standardAndReverseChoice = valueDes;
          break;
        case r'max_iteration_len':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.maxIterationLen = valueDes;
          break;
        case r'min_iteration_len':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.minIterationLen = valueDes;
          break;
        case r'min_watch_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.minWatchCount = valueDes;
          break;
        case r'known_term_part':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.knownTermPart = valueDes;
          break;
        case r'choices_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.choicesCount = valueDes;
          break;
        case r'is_learnt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.isLearnt = valueDes;
          break;
        case r'module_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.moduleId = valueDes;
          break;
        case r'root_folder_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.rootFolderId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateOnlyPersonalizePartModuleDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateOnlyPersonalizePartModuleDTOBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

