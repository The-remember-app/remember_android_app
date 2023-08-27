//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'delete_only_personalize_part_term_dto.g.dart';

/// DeleteOnlyPersonalizePartTermDTO
///
/// Properties:
/// * [termId] 
/// * [userId] 
@BuiltValue()
abstract class DeleteOnlyPersonalizePartTermDTO implements Built<DeleteOnlyPersonalizePartTermDTO, DeleteOnlyPersonalizePartTermDTOBuilder> {
  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  @BuiltValueField(wireName: r'user_id')
  JsonObject? get userId;

  DeleteOnlyPersonalizePartTermDTO._();

  factory DeleteOnlyPersonalizePartTermDTO([void updates(DeleteOnlyPersonalizePartTermDTOBuilder b)]) = _$DeleteOnlyPersonalizePartTermDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteOnlyPersonalizePartTermDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteOnlyPersonalizePartTermDTO> get serializer => _$DeleteOnlyPersonalizePartTermDTOSerializer();
}

class _$DeleteOnlyPersonalizePartTermDTOSerializer implements PrimitiveSerializer<DeleteOnlyPersonalizePartTermDTO> {
  @override
  final Iterable<Type> types = const [DeleteOnlyPersonalizePartTermDTO, _$DeleteOnlyPersonalizePartTermDTO];

  @override
  final String wireName = r'DeleteOnlyPersonalizePartTermDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteOnlyPersonalizePartTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'term_id';
    yield object.termId == null ? null : serializers.serialize(
      object.termId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'user_id';
    yield object.userId == null ? null : serializers.serialize(
      object.userId,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteOnlyPersonalizePartTermDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteOnlyPersonalizePartTermDTOBuilder result,
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
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteOnlyPersonalizePartTermDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteOnlyPersonalizePartTermDTOBuilder();
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

