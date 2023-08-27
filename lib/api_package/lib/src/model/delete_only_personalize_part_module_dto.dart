//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'delete_only_personalize_part_module_dto.g.dart';

/// DeleteOnlyPersonalizePartModuleDTO
///
/// Properties:
/// * [moduleId] 
/// * [userId] 
@BuiltValue()
abstract class DeleteOnlyPersonalizePartModuleDTO implements Built<DeleteOnlyPersonalizePartModuleDTO, DeleteOnlyPersonalizePartModuleDTOBuilder> {
  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

  @BuiltValueField(wireName: r'user_id')
  JsonObject? get userId;

  DeleteOnlyPersonalizePartModuleDTO._();

  factory DeleteOnlyPersonalizePartModuleDTO([void updates(DeleteOnlyPersonalizePartModuleDTOBuilder b)]) = _$DeleteOnlyPersonalizePartModuleDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteOnlyPersonalizePartModuleDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteOnlyPersonalizePartModuleDTO> get serializer => _$DeleteOnlyPersonalizePartModuleDTOSerializer();
}

class _$DeleteOnlyPersonalizePartModuleDTOSerializer implements PrimitiveSerializer<DeleteOnlyPersonalizePartModuleDTO> {
  @override
  final Iterable<Type> types = const [DeleteOnlyPersonalizePartModuleDTO, _$DeleteOnlyPersonalizePartModuleDTO];

  @override
  final String wireName = r'DeleteOnlyPersonalizePartModuleDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteOnlyPersonalizePartModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'module_id';
    yield object.moduleId == null ? null : serializers.serialize(
      object.moduleId,
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
    DeleteOnlyPersonalizePartModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteOnlyPersonalizePartModuleDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'module_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.moduleId = valueDes;
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
  DeleteOnlyPersonalizePartModuleDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteOnlyPersonalizePartModuleDTOBuilder();
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

