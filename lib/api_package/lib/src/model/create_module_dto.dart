//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_module_dto.g.dart';

/// CreateModuleDTO
///
/// Properties:
/// * [name] 
/// * [rootFolderId] 
@BuiltValue()
abstract class CreateModuleDTO implements Built<CreateModuleDTO, CreateModuleDTOBuilder> {
  @BuiltValueField(wireName: r'name')
  JsonObject? get name;

  @BuiltValueField(wireName: r'root_folder_id')
  JsonObject? get rootFolderId;

  CreateModuleDTO._();

  factory CreateModuleDTO([void updates(CreateModuleDTOBuilder b)]) = _$CreateModuleDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateModuleDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateModuleDTO> get serializer => _$CreateModuleDTOSerializer();
}

class _$CreateModuleDTOSerializer implements PrimitiveSerializer<CreateModuleDTO> {
  @override
  final Iterable<Type> types = const [CreateModuleDTO, _$CreateModuleDTO];

  @override
  final String wireName = r'CreateModuleDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateModuleDTO object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateModuleDTOBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateModuleDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateModuleDTOBuilder();
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

