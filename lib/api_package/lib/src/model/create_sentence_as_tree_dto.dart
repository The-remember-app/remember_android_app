//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_sentence_as_tree_dto.g.dart';

/// CreateSentenceAsTreeDTO
///
/// Properties:
/// * [sentence] 
/// * [translate] 
/// * [termId] 
@BuiltValue()
abstract class CreateSentenceAsTreeDTO implements Built<CreateSentenceAsTreeDTO, CreateSentenceAsTreeDTOBuilder> {
  @BuiltValueField(wireName: r'sentence')
  JsonObject? get sentence;

  @BuiltValueField(wireName: r'translate')
  JsonObject? get translate;

  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  CreateSentenceAsTreeDTO._();

  factory CreateSentenceAsTreeDTO([void updates(CreateSentenceAsTreeDTOBuilder b)]) = _$CreateSentenceAsTreeDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateSentenceAsTreeDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateSentenceAsTreeDTO> get serializer => _$CreateSentenceAsTreeDTOSerializer();
}

class _$CreateSentenceAsTreeDTOSerializer implements PrimitiveSerializer<CreateSentenceAsTreeDTO> {
  @override
  final Iterable<Type> types = const [CreateSentenceAsTreeDTO, _$CreateSentenceAsTreeDTO];

  @override
  final String wireName = r'CreateSentenceAsTreeDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateSentenceAsTreeDTO object, {
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
    if (object.termId != null) {
      yield r'term_id';
      yield serializers.serialize(
        object.termId,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateSentenceAsTreeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateSentenceAsTreeDTOBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateSentenceAsTreeDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateSentenceAsTreeDTOBuilder();
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

