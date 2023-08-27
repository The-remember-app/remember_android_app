//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'create_term_as_tree_dto.g.dart';

/// CreateTermAsTreeDTO
///
/// Properties:
/// * [term] 
/// * [definition] 
/// * [moduleId] 
/// * [subSentences] 
/// * [termAdditionalInfoEntities] 
@BuiltValue()
abstract class CreateTermAsTreeDTO implements Built<CreateTermAsTreeDTO, CreateTermAsTreeDTOBuilder> {
  @BuiltValueField(wireName: r'term')
  JsonObject? get term;

  @BuiltValueField(wireName: r'definition')
  JsonObject? get definition;

  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

  @BuiltValueField(wireName: r'sub_sentences')
  JsonObject? get subSentences;

  @BuiltValueField(wireName: r'term_additional_info_entities')
  JsonObject? get termAdditionalInfoEntities;

  CreateTermAsTreeDTO._();

  factory CreateTermAsTreeDTO([void updates(CreateTermAsTreeDTOBuilder b)]) = _$CreateTermAsTreeDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateTermAsTreeDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateTermAsTreeDTO> get serializer => _$CreateTermAsTreeDTOSerializer();
}

class _$CreateTermAsTreeDTOSerializer implements PrimitiveSerializer<CreateTermAsTreeDTO> {
  @override
  final Iterable<Type> types = const [CreateTermAsTreeDTO, _$CreateTermAsTreeDTO];

  @override
  final String wireName = r'CreateTermAsTreeDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateTermAsTreeDTO object, {
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
    if (object.moduleId != null) {
      yield r'module_id';
      yield serializers.serialize(
        object.moduleId,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.subSentences != null) {
      yield r'sub_sentences';
      yield serializers.serialize(
        object.subSentences,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.termAdditionalInfoEntities != null) {
      yield r'term_additional_info_entities';
      yield serializers.serialize(
        object.termAdditionalInfoEntities,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateTermAsTreeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateTermAsTreeDTOBuilder result,
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
        case r'sub_sentences':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.subSentences = valueDes;
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
  CreateTermAsTreeDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateTermAsTreeDTOBuilder();
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

