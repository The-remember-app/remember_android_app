//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'only_personalize_part_term_dto.g.dart';

/// OnlyPersonalizePartTermDTO
///
/// Properties:
/// * [userId] 
/// * [chooseErrorCounter] 
/// * [writeErrorCounter] 
/// * [choiceNegErrorCounter] 
/// * [personalCreatedAt] 
/// * [personalUpdatedAt] 
/// * [termId] 
/// * [moduleId] 
@BuiltValue()
abstract class OnlyPersonalizePartTermDTO implements Built<OnlyPersonalizePartTermDTO, OnlyPersonalizePartTermDTOBuilder> {
  @BuiltValueField(wireName: r'user_id')
  JsonObject? get userId;

  @BuiltValueField(wireName: r'choose_error_counter')
  JsonObject? get chooseErrorCounter;

  @BuiltValueField(wireName: r'write_error_counter')
  JsonObject? get writeErrorCounter;

  @BuiltValueField(wireName: r'choice_neg_error_counter')
  JsonObject? get choiceNegErrorCounter;

  @BuiltValueField(wireName: r'personal_created_at')
  JsonObject? get personalCreatedAt;

  @BuiltValueField(wireName: r'personal_updated_at')
  JsonObject? get personalUpdatedAt;

  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

  OnlyPersonalizePartTermDTO._();

  factory OnlyPersonalizePartTermDTO([void updates(OnlyPersonalizePartTermDTOBuilder b)]) = _$OnlyPersonalizePartTermDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OnlyPersonalizePartTermDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OnlyPersonalizePartTermDTO> get serializer => _$OnlyPersonalizePartTermDTOSerializer();
}

class _$OnlyPersonalizePartTermDTOSerializer implements PrimitiveSerializer<OnlyPersonalizePartTermDTO> {
  @override
  final Iterable<Type> types = const [OnlyPersonalizePartTermDTO, _$OnlyPersonalizePartTermDTO];

  @override
  final String wireName = r'OnlyPersonalizePartTermDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OnlyPersonalizePartTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield object.userId == null ? null : serializers.serialize(
      object.userId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'choose_error_counter';
    yield object.chooseErrorCounter == null ? null : serializers.serialize(
      object.chooseErrorCounter,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'write_error_counter';
    yield object.writeErrorCounter == null ? null : serializers.serialize(
      object.writeErrorCounter,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'choice_neg_error_counter';
    yield object.choiceNegErrorCounter == null ? null : serializers.serialize(
      object.choiceNegErrorCounter,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'personal_created_at';
    yield object.personalCreatedAt == null ? null : serializers.serialize(
      object.personalCreatedAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'personal_updated_at';
    yield object.personalUpdatedAt == null ? null : serializers.serialize(
      object.personalUpdatedAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'term_id';
    yield object.termId == null ? null : serializers.serialize(
      object.termId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'module_id';
    yield object.moduleId == null ? null : serializers.serialize(
      object.moduleId,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    OnlyPersonalizePartTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OnlyPersonalizePartTermDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'choose_error_counter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.chooseErrorCounter = valueDes;
          break;
        case r'write_error_counter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.writeErrorCounter = valueDes;
          break;
        case r'choice_neg_error_counter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.choiceNegErrorCounter = valueDes;
          break;
        case r'personal_created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.personalCreatedAt = valueDes;
          break;
        case r'personal_updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.personalUpdatedAt = valueDes;
          break;
        case r'term_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.termId = valueDes;
          break;
        case r'module_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.moduleId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OnlyPersonalizePartTermDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OnlyPersonalizePartTermDTOBuilder();
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

