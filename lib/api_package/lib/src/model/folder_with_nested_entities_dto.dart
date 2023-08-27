//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'folder_with_nested_entities_dto.g.dart';

/// FolderWithNestedEntitiesDTO
///
/// Properties:
/// * [name] 
/// * [rootFolderId] 
/// * [id] 
/// * [authorId] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [subFolders] 
/// * [subModules] 
@BuiltValue()
abstract class FolderWithNestedEntitiesDTO implements Built<FolderWithNestedEntitiesDTO, FolderWithNestedEntitiesDTOBuilder> {
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

  @BuiltValueField(wireName: r'sub_folders')
  JsonObject? get subFolders;

  @BuiltValueField(wireName: r'sub_modules')
  JsonObject? get subModules;

  FolderWithNestedEntitiesDTO._();

  factory FolderWithNestedEntitiesDTO([void updates(FolderWithNestedEntitiesDTOBuilder b)]) = _$FolderWithNestedEntitiesDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FolderWithNestedEntitiesDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FolderWithNestedEntitiesDTO> get serializer => _$FolderWithNestedEntitiesDTOSerializer();
}

class _$FolderWithNestedEntitiesDTOSerializer implements PrimitiveSerializer<FolderWithNestedEntitiesDTO> {
  @override
  final Iterable<Type> types = const [FolderWithNestedEntitiesDTO, _$FolderWithNestedEntitiesDTO];

  @override
  final String wireName = r'FolderWithNestedEntitiesDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FolderWithNestedEntitiesDTO object, {
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
    yield r'sub_folders';
    yield object.subFolders == null ? null : serializers.serialize(
      object.subFolders,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'sub_modules';
    yield object.subModules == null ? null : serializers.serialize(
      object.subModules,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FolderWithNestedEntitiesDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FolderWithNestedEntitiesDTOBuilder result,
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
        case r'sub_folders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.subFolders = valueDes;
          break;
        case r'sub_modules':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.subModules = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FolderWithNestedEntitiesDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FolderWithNestedEntitiesDTOBuilder();
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

