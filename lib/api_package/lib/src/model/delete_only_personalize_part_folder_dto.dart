//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'delete_only_personalize_part_folder_dto.g.dart';

/// DeleteOnlyPersonalizePartFolderDTO
///
/// Properties:
/// * [userId] 
/// * [folderId] 
@BuiltValue()
abstract class DeleteOnlyPersonalizePartFolderDTO implements Built<DeleteOnlyPersonalizePartFolderDTO, DeleteOnlyPersonalizePartFolderDTOBuilder> {
  @BuiltValueField(wireName: r'user_id')
  JsonObject? get userId;

  @BuiltValueField(wireName: r'folder_id')
  JsonObject? get folderId;

  DeleteOnlyPersonalizePartFolderDTO._();

  factory DeleteOnlyPersonalizePartFolderDTO([void updates(DeleteOnlyPersonalizePartFolderDTOBuilder b)]) = _$DeleteOnlyPersonalizePartFolderDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteOnlyPersonalizePartFolderDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteOnlyPersonalizePartFolderDTO> get serializer => _$DeleteOnlyPersonalizePartFolderDTOSerializer();
}

class _$DeleteOnlyPersonalizePartFolderDTOSerializer implements PrimitiveSerializer<DeleteOnlyPersonalizePartFolderDTO> {
  @override
  final Iterable<Type> types = const [DeleteOnlyPersonalizePartFolderDTO, _$DeleteOnlyPersonalizePartFolderDTO];

  @override
  final String wireName = r'DeleteOnlyPersonalizePartFolderDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteOnlyPersonalizePartFolderDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield object.userId == null ? null : serializers.serialize(
      object.userId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'folder_id';
    yield object.folderId == null ? null : serializers.serialize(
      object.folderId,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteOnlyPersonalizePartFolderDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DeleteOnlyPersonalizePartFolderDTOBuilder result,
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
        case r'folder_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.folderId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteOnlyPersonalizePartFolderDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteOnlyPersonalizePartFolderDTOBuilder();
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

