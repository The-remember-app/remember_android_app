//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_term_dto.g.dart';

/// CreateTermDTO
///
/// Properties:
/// * [term] 
/// * [definition] 
/// * [moduleId] 
@BuiltValue()
abstract class CreateTermDTO implements Built<CreateTermDTO, CreateTermDTOBuilder> {
  @BuiltValueField(wireName: r'term')
  JsonObject? get term;

  @BuiltValueField(wireName: r'definition')
  JsonObject? get definition;

  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

  CreateTermDTO._();

  factory CreateTermDTO([void updates(CreateTermDTOBuilder b)]) = _$CreateTermDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateTermDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateTermDTO> get serializer => _$CreateTermDTOSerializer();
}

class _$CreateTermDTOSerializer implements PrimitiveSerializer<CreateTermDTO> {
  @override
  final Iterable<Type> types = const [CreateTermDTO, _$CreateTermDTO];

  @override
  final String wireName = r'CreateTermDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateTermDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateTermDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateTermDTOBuilder();
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

