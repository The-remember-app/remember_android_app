//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'only_personalize_part_folder_dto.g.dart';

/// OnlyPersonalizePartFolderDTO
///
/// Properties:
/// * [userId] 
/// * [personalCreatedAt] 
/// * [personalUpdatedAt] 
/// * [folderId] 
/// * [rootFolderId] 
@BuiltValue()
abstract class OnlyPersonalizePartFolderDTO implements Built<OnlyPersonalizePartFolderDTO, OnlyPersonalizePartFolderDTOBuilder> {
  @BuiltValueField(wireName: r'user_id')
  JsonObject? get userId;

  @BuiltValueField(wireName: r'personal_created_at')
  JsonObject? get personalCreatedAt;

  @BuiltValueField(wireName: r'personal_updated_at')
  JsonObject? get personalUpdatedAt;

  @BuiltValueField(wireName: r'folder_id')
  JsonObject? get folderId;

  @BuiltValueField(wireName: r'root_folder_id')
  JsonObject? get rootFolderId;

  OnlyPersonalizePartFolderDTO._();

  factory OnlyPersonalizePartFolderDTO([void updates(OnlyPersonalizePartFolderDTOBuilder b)]) = _$OnlyPersonalizePartFolderDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OnlyPersonalizePartFolderDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OnlyPersonalizePartFolderDTO> get serializer => _$OnlyPersonalizePartFolderDTOSerializer();
}

class _$OnlyPersonalizePartFolderDTOSerializer implements PrimitiveSerializer<OnlyPersonalizePartFolderDTO> {
  @override
  final Iterable<Type> types = const [OnlyPersonalizePartFolderDTO, _$OnlyPersonalizePartFolderDTO];

  @override
  final String wireName = r'OnlyPersonalizePartFolderDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OnlyPersonalizePartFolderDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield object.userId == null ? null : serializers.serialize(
      object.userId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'personal_created_at';
    yield object.personalCreatedAt == null ? null : serializers.serialize(
      object.personalCreatedAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'personal_updated_at';
    yield object.personalUpdatedAt == null ? null : serializers.serialize(
      object.personalUpdatedAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'folder_id';
    yield object.folderId == null ? null : serializers.serialize(
      object.folderId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'root_folder_id';
    yield object.rootFolderId == null ? null : serializers.serialize(
      object.rootFolderId,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    OnlyPersonalizePartFolderDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OnlyPersonalizePartFolderDTOBuilder result,
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
        case r'personal_created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.personalCreatedAt = valueDes;
          break;
        case r'personal_updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.personalUpdatedAt = valueDes;
          break;
        case r'folder_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.folderId = valueDes;
          break;
        case r'root_folder_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.rootFolderId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OnlyPersonalizePartFolderDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OnlyPersonalizePartFolderDTOBuilder();
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

