//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_folder_as_tree_dto.g.dart';

/// CreateFolderAsTreeDTO
///
/// Properties:
/// * [name] 
/// * [rootFolderId] 
/// * [id] 
/// * [subFolders] 
/// * [subModules] 
@BuiltValue()
abstract class CreateFolderAsTreeDTO implements Built<CreateFolderAsTreeDTO, CreateFolderAsTreeDTOBuilder> {
  @BuiltValueField(wireName: r'name')
  JsonObject? get name;

  @BuiltValueField(wireName: r'root_folder_id')
  JsonObject? get rootFolderId;

  @BuiltValueField(wireName: r'id')
  JsonObject? get id;

  @BuiltValueField(wireName: r'sub_folders')
  JsonObject? get subFolders;

  @BuiltValueField(wireName: r'sub_modules')
  JsonObject? get subModules;

  CreateFolderAsTreeDTO._();

  factory CreateFolderAsTreeDTO([void updates(CreateFolderAsTreeDTOBuilder b)]) = _$CreateFolderAsTreeDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateFolderAsTreeDTOBuilder b) => b
      ..subFolders = JsonObject(<JsonObject?>[])
      ..subModules = JsonObject(<JsonObject?>[]);

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateFolderAsTreeDTO> get serializer => _$CreateFolderAsTreeDTOSerializer();
}

class _$CreateFolderAsTreeDTOSerializer implements PrimitiveSerializer<CreateFolderAsTreeDTO> {
  @override
  final Iterable<Type> types = const [CreateFolderAsTreeDTO, _$CreateFolderAsTreeDTO];

  @override
  final String wireName = r'CreateFolderAsTreeDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateFolderAsTreeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield object.name == null ? null : serializers.serialize(
      object.name,
      specifiedType: const FullType.nullable(JsonObject),
    );
    if (object.rootFolderId != null) {
      yield r'root_folder_id';
      yield serializers.serialize(
        object.rootFolderId,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.subFolders != null) {
      yield r'sub_folders';
      yield serializers.serialize(
        object.subFolders,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.subModules != null) {
      yield r'sub_modules';
      yield serializers.serialize(
        object.subModules,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateFolderAsTreeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateFolderAsTreeDTOBuilder result,
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
  CreateFolderAsTreeDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateFolderAsTreeDTOBuilder();
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

