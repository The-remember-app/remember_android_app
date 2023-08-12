//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'term_dto.g.dart';

/// TermDTO
///
/// Properties:
/// * [id] 
/// * [term] 
/// * [definition] 
/// * [moduleId] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class TermDTO implements Built<TermDTO, TermDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  JsonObject? get id;

  @BuiltValueField(wireName: r'term')
  JsonObject? get term;

  @BuiltValueField(wireName: r'definition')
  JsonObject? get definition;

  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

  @BuiltValueField(wireName: r'created_at')
  JsonObject? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  JsonObject? get updatedAt;

  TermDTO._();

  factory TermDTO([void updates(TermDTOBuilder b)]) = _$TermDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TermDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TermDTO> get serializer => _$TermDTOSerializer();
}

class _$TermDTOSerializer implements PrimitiveSerializer<TermDTO> {
  @override
  final Iterable<Type> types = const [TermDTO, _$TermDTO];

  @override
  final String wireName = r'TermDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield object.id == null ? null : serializers.serialize(
      object.id,
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
    TermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TermDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.id = valueDes;
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
  TermDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TermDTOBuilder();
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

