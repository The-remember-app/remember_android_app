//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'personalize_term_with_add_info_dto.g.dart';

/// PersonalizeTermWithAddInfoDTO
///
/// Properties:
/// * [userId] 
/// * [chooseErrorCounter] 
/// * [writeErrorCounter] 
/// * [choiceNegErrorCounter] 
/// * [watchCount] 
/// * [personalCreatedAt] 
/// * [personalUpdatedAt] 
/// * [term] 
/// * [definition] 
/// * [moduleId] 
/// * [id] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [termAdditionalInfoEntities] 
@BuiltValue()
abstract class PersonalizeTermWithAddInfoDTO implements Built<PersonalizeTermWithAddInfoDTO, PersonalizeTermWithAddInfoDTOBuilder> {
  @BuiltValueField(wireName: r'user_id')
  JsonObject? get userId;

  @BuiltValueField(wireName: r'choose_error_counter')
  JsonObject? get chooseErrorCounter;

  @BuiltValueField(wireName: r'write_error_counter')
  JsonObject? get writeErrorCounter;

  @BuiltValueField(wireName: r'choice_neg_error_counter')
  JsonObject? get choiceNegErrorCounter;

  @BuiltValueField(wireName: r'watch_count')
  JsonObject? get watchCount;

  @BuiltValueField(wireName: r'personal_created_at')
  JsonObject? get personalCreatedAt;

  @BuiltValueField(wireName: r'personal_updated_at')
  JsonObject? get personalUpdatedAt;

  @BuiltValueField(wireName: r'term')
  JsonObject? get term;

  @BuiltValueField(wireName: r'definition')
  JsonObject? get definition;

  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

  @BuiltValueField(wireName: r'id')
  JsonObject? get id;

  @BuiltValueField(wireName: r'created_at')
  JsonObject? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  JsonObject? get updatedAt;

  @BuiltValueField(wireName: r'term_additional_info_entities')
  JsonObject? get termAdditionalInfoEntities;

  PersonalizeTermWithAddInfoDTO._();

  factory PersonalizeTermWithAddInfoDTO([void updates(PersonalizeTermWithAddInfoDTOBuilder b)]) = _$PersonalizeTermWithAddInfoDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PersonalizeTermWithAddInfoDTOBuilder b) => b
      ..termAdditionalInfoEntities = JsonObject(<JsonObject?>[]);

  @BuiltValueSerializer(custom: true)
  static Serializer<PersonalizeTermWithAddInfoDTO> get serializer => _$PersonalizeTermWithAddInfoDTOSerializer();
}

class _$PersonalizeTermWithAddInfoDTOSerializer implements PrimitiveSerializer<PersonalizeTermWithAddInfoDTO> {
  @override
  final Iterable<Type> types = const [PersonalizeTermWithAddInfoDTO, _$PersonalizeTermWithAddInfoDTO];

  @override
  final String wireName = r'PersonalizeTermWithAddInfoDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PersonalizeTermWithAddInfoDTO object, {
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
    yield r'watch_count';
    yield object.watchCount == null ? null : serializers.serialize(
      object.watchCount,
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
    yield r'term';
    yield object.term == null ? null : serializers.serialize(
      object.term,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'definition';
    yield object.definition == null ? null : serializers.serialize(
      object.definition,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'module_id';
    yield object.moduleId == null ? null : serializers.serialize(
      object.moduleId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'id';
    yield object.id == null ? null : serializers.serialize(
      object.id,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'created_at';
    yield object.createdAt == null ? null : serializers.serialize(
      object.createdAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'updated_at';
    yield object.updatedAt == null ? null : serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'term_additional_info_entities';
    yield object.termAdditionalInfoEntities == null ? null : serializers.serialize(
      object.termAdditionalInfoEntities,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PersonalizeTermWithAddInfoDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PersonalizeTermWithAddInfoDTOBuilder result,
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
        case r'watch_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.watchCount = valueDes;
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
        case r'term':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.term = valueDes;
          break;
        case r'definition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.definition = valueDes;
          break;
        case r'module_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.moduleId = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        case r'term_additional_info_entities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.termAdditionalInfoEntities = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PersonalizeTermWithAddInfoDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PersonalizeTermWithAddInfoDTOBuilder();
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

