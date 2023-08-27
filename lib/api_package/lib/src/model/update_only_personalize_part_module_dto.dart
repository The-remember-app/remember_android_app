//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_only_personalize_part_module_dto.g.dart';

/// UpdateOnlyPersonalizePartModuleDTO
///
/// Properties:
/// * [moduleId] 
/// * [isReverseDefinitionWrite] 
/// * [standardAndReverseWrite] 
/// * [isReverseDefinitionChoice] 
/// * [standardAndReverseChoice] 
/// * [maxIterationLen] 
/// * [minIterationLen] 
/// * [minWatchCount] 
/// * [knownTermPart] 
/// * [choicesCount] 
/// * [personalUpdatedAt] 
@BuiltValue()
abstract class UpdateOnlyPersonalizePartModuleDTO implements Built<UpdateOnlyPersonalizePartModuleDTO, UpdateOnlyPersonalizePartModuleDTOBuilder> {
  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

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

  @BuiltValueField(wireName: r'personal_updated_at')
  JsonObject? get personalUpdatedAt;

  UpdateOnlyPersonalizePartModuleDTO._();

  factory UpdateOnlyPersonalizePartModuleDTO([void updates(UpdateOnlyPersonalizePartModuleDTOBuilder b)]) = _$UpdateOnlyPersonalizePartModuleDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateOnlyPersonalizePartModuleDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateOnlyPersonalizePartModuleDTO> get serializer => _$UpdateOnlyPersonalizePartModuleDTOSerializer();
}

class _$UpdateOnlyPersonalizePartModuleDTOSerializer implements PrimitiveSerializer<UpdateOnlyPersonalizePartModuleDTO> {
  @override
  final Iterable<Type> types = const [UpdateOnlyPersonalizePartModuleDTO, _$UpdateOnlyPersonalizePartModuleDTO];

  @override
  final String wireName = r'UpdateOnlyPersonalizePartModuleDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateOnlyPersonalizePartModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'module_id';
    yield object.moduleId == null ? null : serializers.serialize(
      object.moduleId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'is_reverse_definition_write';
    yield object.isReverseDefinitionWrite == null ? null : serializers.serialize(
      object.isReverseDefinitionWrite,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'standard_and_reverse_write';
    yield object.standardAndReverseWrite == null ? null : serializers.serialize(
      object.standardAndReverseWrite,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'is_reverse_definition_choice';
    yield object.isReverseDefinitionChoice == null ? null : serializers.serialize(
      object.isReverseDefinitionChoice,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'standard_and_reverse_choice';
    yield object.standardAndReverseChoice == null ? null : serializers.serialize(
      object.standardAndReverseChoice,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'max_iteration_len';
    yield object.maxIterationLen == null ? null : serializers.serialize(
      object.maxIterationLen,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'min_iteration_len';
    yield object.minIterationLen == null ? null : serializers.serialize(
      object.minIterationLen,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'min_watch_count';
    yield object.minWatchCount == null ? null : serializers.serialize(
      object.minWatchCount,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'known_term_part';
    yield object.knownTermPart == null ? null : serializers.serialize(
      object.knownTermPart,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'choices_count';
    yield object.choicesCount == null ? null : serializers.serialize(
      object.choicesCount,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'personal_updated_at';
    yield object.personalUpdatedAt == null ? null : serializers.serialize(
      object.personalUpdatedAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateOnlyPersonalizePartModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateOnlyPersonalizePartModuleDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'module_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.moduleId = valueDes;
          break;
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
        case r'personal_updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.personalUpdatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateOnlyPersonalizePartModuleDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateOnlyPersonalizePartModuleDTOBuilder();
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

