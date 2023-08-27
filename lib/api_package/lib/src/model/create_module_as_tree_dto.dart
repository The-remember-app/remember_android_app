//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_module_as_tree_dto.g.dart';

/// CreateModuleAsTreeDTO
///
/// Properties:
/// * [name] 
/// * [description] 
/// * [rootFolderId] 
/// * [id] 
/// * [subTerms] 
@BuiltValue()
abstract class CreateModuleAsTreeDTO implements Built<CreateModuleAsTreeDTO, CreateModuleAsTreeDTOBuilder> {
  @BuiltValueField(wireName: r'name')
  JsonObject? get name;

  @BuiltValueField(wireName: r'description')
  JsonObject? get description;

  @BuiltValueField(wireName: r'root_folder_id')
  JsonObject? get rootFolderId;

  @BuiltValueField(wireName: r'id')
  JsonObject? get id;

  @BuiltValueField(wireName: r'sub_terms')
  JsonObject? get subTerms;

  CreateModuleAsTreeDTO._();

  factory CreateModuleAsTreeDTO([void updates(CreateModuleAsTreeDTOBuilder b)]) = _$CreateModuleAsTreeDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateModuleAsTreeDTOBuilder b) => b
      ..description = JsonObject("")
      ..subTerms = JsonObject(<JsonObject?>[]);

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateModuleAsTreeDTO> get serializer => _$CreateModuleAsTreeDTOSerializer();
}

class _$CreateModuleAsTreeDTOSerializer implements PrimitiveSerializer<CreateModuleAsTreeDTO> {
  @override
  final Iterable<Type> types = const [CreateModuleAsTreeDTO, _$CreateModuleAsTreeDTO];

  @override
  final String wireName = r'CreateModuleAsTreeDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateModuleAsTreeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield object.name == null ? null : serializers.serialize(
      object.name,
      specifiedType: const FullType.nullable(JsonObject),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
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
    if (object.subTerms != null) {
      yield r'sub_terms';
      yield serializers.serialize(
        object.subTerms,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateModuleAsTreeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateModuleAsTreeDTOBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.description = valueDes;
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
        case r'sub_terms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.subTerms = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateModuleAsTreeDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateModuleAsTreeDTOBuilder();
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

