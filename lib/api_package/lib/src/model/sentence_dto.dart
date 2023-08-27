//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'sentence_dto.g.dart';

/// SentenceDTO
///
/// Properties:
/// * [sentence] 
/// * [translate] 
/// * [termId] 
/// * [id] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class SentenceDTO implements Built<SentenceDTO, SentenceDTOBuilder> {
  @BuiltValueField(wireName: r'sentence')
  JsonObject? get sentence;

  @BuiltValueField(wireName: r'translate')
  JsonObject? get translate;

  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  @BuiltValueField(wireName: r'id')
  JsonObject? get id;

  @BuiltValueField(wireName: r'created_at')
  JsonObject? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  JsonObject? get updatedAt;

  SentenceDTO._();

  factory SentenceDTO([void updates(SentenceDTOBuilder b)]) = _$SentenceDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SentenceDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SentenceDTO> get serializer => _$SentenceDTOSerializer();
}

class _$SentenceDTOSerializer implements PrimitiveSerializer<SentenceDTO> {
  @override
  final Iterable<Type> types = const [SentenceDTO, _$SentenceDTO];

  @override
  final String wireName = r'SentenceDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SentenceDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'sentence';
    yield object.sentence == null ? null : serializers.serialize(
      object.sentence,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'translate';
    yield object.translate == null ? null : serializers.serialize(
      object.translate,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'term_id';
    yield object.termId == null ? null : serializers.serialize(
      object.termId,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    SentenceDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SentenceDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sentence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.sentence = valueDes;
          break;
        case r'translate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.translate = valueDes;
          break;
        case r'term_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.termId = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SentenceDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SentenceDTOBuilder();
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

