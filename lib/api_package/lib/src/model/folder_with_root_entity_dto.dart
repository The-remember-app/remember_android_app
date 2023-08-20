//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'folder_with_root_entity_dto.g.dart';

/// FolderWithRootEntityDTO
///
/// Properties:
/// * [name] 
/// * [rootFolderId] 
/// * [id] 
/// * [authorId] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [rootFolderEntity] 
@BuiltValue()
abstract class FolderWithRootEntityDTO implements Built<FolderWithRootEntityDTO, FolderWithRootEntityDTOBuilder> {
  @BuiltValueField(wireName: r'name')
  JsonObject? get name;

  @BuiltValueField(wireName: r'root_folder_id')
  JsonObject? get rootFolderId;

  @BuiltValueField(wireName: r'id')
  JsonObject? get id;

  @BuiltValueField(wireName: r'author_id')
  JsonObject? get authorId;

  @BuiltValueField(wireName: r'created_at')
  JsonObject? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  JsonObject? get updatedAt;

  @BuiltValueField(wireName: r'root_folder_entity')
  FolderWithRootEntityDTO? get rootFolderEntity;

  FolderWithRootEntityDTO._();

  factory FolderWithRootEntityDTO([void updates(FolderWithRootEntityDTOBuilder b)]) = _$FolderWithRootEntityDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FolderWithRootEntityDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FolderWithRootEntityDTO> get serializer => _$FolderWithRootEntityDTOSerializer();
}

class _$FolderWithRootEntityDTOSerializer implements PrimitiveSerializer<FolderWithRootEntityDTO> {
  @override
  final Iterable<Type> types = const [FolderWithRootEntityDTO, _$FolderWithRootEntityDTO];

  @override
  final String wireName = r'FolderWithRootEntityDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FolderWithRootEntityDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield object.name == null ? null : serializers.serialize(
      object.name,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'root_folder_id';
    yield object.rootFolderId == null ? null : serializers.serialize(
      object.rootFolderId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'id';
    yield object.id == null ? null : serializers.serialize(
      object.id,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'author_id';
    yield object.authorId == null ? null : serializers.serialize(
      object.authorId,
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
    yield r'root_folder_entity';
    yield object.rootFolderEntity == null ? null : serializers.serialize(
      object.rootFolderEntity,
      specifiedType: const FullType.nullable(FolderWithRootEntityDTO),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FolderWithRootEntityDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FolderWithRootEntityDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'root_folder_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.rootFolderId = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'author_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.authorId = valueDes;
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
        case r'root_folder_entity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(FolderWithRootEntityDTO),
          ) as FolderWithRootEntityDTO?;
          if (valueDes == null) continue;
          result.rootFolderEntity.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FolderWithRootEntityDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FolderWithRootEntityDTOBuilder();
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

