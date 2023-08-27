//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'update_only_personalize_part_folder_dto.g.dart';

/// UpdateOnlyPersonalizePartFolderDTO
///
/// Properties:
/// * [folderId] 
/// * [personalUpdateAt] 
@BuiltValue()
abstract class UpdateOnlyPersonalizePartFolderDTO implements Built<UpdateOnlyPersonalizePartFolderDTO, UpdateOnlyPersonalizePartFolderDTOBuilder> {
  @BuiltValueField(wireName: r'folder_id')
  JsonObject? get folderId;

  @BuiltValueField(wireName: r'personal_update_at')
  JsonObject? get personalUpdateAt;

  UpdateOnlyPersonalizePartFolderDTO._();

  factory UpdateOnlyPersonalizePartFolderDTO([void updates(UpdateOnlyPersonalizePartFolderDTOBuilder b)]) = _$UpdateOnlyPersonalizePartFolderDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateOnlyPersonalizePartFolderDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateOnlyPersonalizePartFolderDTO> get serializer => _$UpdateOnlyPersonalizePartFolderDTOSerializer();
}

class _$UpdateOnlyPersonalizePartFolderDTOSerializer implements PrimitiveSerializer<UpdateOnlyPersonalizePartFolderDTO> {
  @override
  final Iterable<Type> types = const [UpdateOnlyPersonalizePartFolderDTO, _$UpdateOnlyPersonalizePartFolderDTO];

  @override
  final String wireName = r'UpdateOnlyPersonalizePartFolderDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateOnlyPersonalizePartFolderDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'folder_id';
    yield object.folderId == null ? null : serializers.serialize(
      object.folderId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'personal_update_at';
    yield object.personalUpdateAt == null ? null : serializers.serialize(
      object.personalUpdateAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateOnlyPersonalizePartFolderDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateOnlyPersonalizePartFolderDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'folder_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.folderId = valueDes;
          break;
        case r'personal_update_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.personalUpdateAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateOnlyPersonalizePartFolderDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateOnlyPersonalizePartFolderDTOBuilder();
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

