//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_only_personalize_part_term_dto.g.dart';

/// UpdateOnlyPersonalizePartTermDTO
///
/// Properties:
/// * [termId] 
/// * [chooseErrorCounter] 
/// * [writeErrorCounter] 
/// * [choiceNegErrorCounter] 
/// * [personalUpdatedAt] 
@BuiltValue()
abstract class UpdateOnlyPersonalizePartTermDTO implements Built<UpdateOnlyPersonalizePartTermDTO, UpdateOnlyPersonalizePartTermDTOBuilder> {
  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  @BuiltValueField(wireName: r'choose_error_counter')
  JsonObject? get chooseErrorCounter;

  @BuiltValueField(wireName: r'write_error_counter')
  JsonObject? get writeErrorCounter;

  @BuiltValueField(wireName: r'choice_neg_error_counter')
  JsonObject? get choiceNegErrorCounter;

  @BuiltValueField(wireName: r'personal_updated_at')
  JsonObject? get personalUpdatedAt;

  UpdateOnlyPersonalizePartTermDTO._();

  factory UpdateOnlyPersonalizePartTermDTO([void updates(UpdateOnlyPersonalizePartTermDTOBuilder b)]) = _$UpdateOnlyPersonalizePartTermDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateOnlyPersonalizePartTermDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateOnlyPersonalizePartTermDTO> get serializer => _$UpdateOnlyPersonalizePartTermDTOSerializer();
}

class _$UpdateOnlyPersonalizePartTermDTOSerializer implements PrimitiveSerializer<UpdateOnlyPersonalizePartTermDTO> {
  @override
  final Iterable<Type> types = const [UpdateOnlyPersonalizePartTermDTO, _$UpdateOnlyPersonalizePartTermDTO];

  @override
  final String wireName = r'UpdateOnlyPersonalizePartTermDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateOnlyPersonalizePartTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'term_id';
    yield object.termId == null ? null : serializers.serialize(
      object.termId,
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
    yield r'personal_updated_at';
    yield object.personalUpdatedAt == null ? null : serializers.serialize(
      object.personalUpdatedAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateOnlyPersonalizePartTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateOnlyPersonalizePartTermDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'term_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.termId = valueDes;
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
  UpdateOnlyPersonalizePartTermDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateOnlyPersonalizePartTermDTOBuilder();
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

