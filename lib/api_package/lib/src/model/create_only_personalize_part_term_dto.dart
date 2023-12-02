//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_only_personalize_part_term_dto.g.dart';

/// CreateOnlyPersonalizePartTermDTO
///
/// Properties:
/// * [chooseErrorCounter] 
/// * [writeErrorCounter] 
/// * [choiceNegErrorCounter] 
/// * [watchCount] 
/// * [termId] 
@BuiltValue()
abstract class CreateOnlyPersonalizePartTermDTO implements Built<CreateOnlyPersonalizePartTermDTO, CreateOnlyPersonalizePartTermDTOBuilder> {
  @BuiltValueField(wireName: r'choose_error_counter')
  JsonObject? get chooseErrorCounter;

  @BuiltValueField(wireName: r'write_error_counter')
  JsonObject? get writeErrorCounter;

  @BuiltValueField(wireName: r'choice_neg_error_counter')
  JsonObject? get choiceNegErrorCounter;

  @BuiltValueField(wireName: r'watch_count')
  JsonObject? get watchCount;

  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  CreateOnlyPersonalizePartTermDTO._();

  factory CreateOnlyPersonalizePartTermDTO([void updates(CreateOnlyPersonalizePartTermDTOBuilder b)]) = _$CreateOnlyPersonalizePartTermDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateOnlyPersonalizePartTermDTOBuilder b) => b
      ..chooseErrorCounter = JsonObject(0)
      ..writeErrorCounter = JsonObject(0)
      ..choiceNegErrorCounter = JsonObject(0)
      ..watchCount = JsonObject(0);

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateOnlyPersonalizePartTermDTO> get serializer => _$CreateOnlyPersonalizePartTermDTOSerializer();
}

class _$CreateOnlyPersonalizePartTermDTOSerializer implements PrimitiveSerializer<CreateOnlyPersonalizePartTermDTO> {
  @override
  final Iterable<Type> types = const [CreateOnlyPersonalizePartTermDTO, _$CreateOnlyPersonalizePartTermDTO];

  @override
  final String wireName = r'CreateOnlyPersonalizePartTermDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateOnlyPersonalizePartTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.chooseErrorCounter != null) {
      yield r'choose_error_counter';
      yield serializers.serialize(
        object.chooseErrorCounter,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.writeErrorCounter != null) {
      yield r'write_error_counter';
      yield serializers.serialize(
        object.writeErrorCounter,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.choiceNegErrorCounter != null) {
      yield r'choice_neg_error_counter';
      yield serializers.serialize(
        object.choiceNegErrorCounter,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.watchCount != null) {
      yield r'watch_count';
      yield serializers.serialize(
        object.watchCount,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    yield r'term_id';
    yield object.termId == null ? null : serializers.serialize(
      object.termId,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateOnlyPersonalizePartTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateOnlyPersonalizePartTermDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  CreateOnlyPersonalizePartTermDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateOnlyPersonalizePartTermDTOBuilder();
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

