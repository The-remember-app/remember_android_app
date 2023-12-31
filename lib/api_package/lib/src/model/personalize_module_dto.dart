//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'personalize_module_dto.g.dart';

/// PersonalizeModuleDTO
///
/// Properties:
/// * [userId] 
/// * [isReverseDefinitionWrite] 
/// * [standardAndReverseWrite] 
/// * [isReverseDefinitionChoice] 
/// * [standardAndReverseChoice] 
/// * [maxIterationLen] 
/// * [minIterationLen] 
/// * [minWatchCount] 
/// * [knownTermPart] 
/// * [choicesCount] 
/// * [isLearnt] 
/// * [personalCreatedAt] 
/// * [personalUpdatedAt] 
/// * [name] 
/// * [description] 
/// * [rootFolderId] 
/// * [id] 
/// * [authorId] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class PersonalizeModuleDTO implements Built<PersonalizeModuleDTO, PersonalizeModuleDTOBuilder> {
  @BuiltValueField(wireName: r'user_id')
  JsonObject? get userId;

  @BuiltValueField(wireName: r'is_reverse_definition_write')
  JsonObject? get isReverseDefinitionWrite;

  @BuiltValueField(wireName: r'standard_and_reverse_write')
  JsonObject? get standardAndReverseWrite;

  @BuiltValueField(wireName: r'is_reverse_definition_choice')
  JsonObject? get isReverseDefinitionChoice;

  @BuiltValueField(wireName: r'standard_and_reverse_choice')
  JsonObject? get standardAndReverseChoice;

  @BuiltValueField(wireName: r'max_iteration_len')
  JsonObject? get maxIterationLen;

  @BuiltValueField(wireName: r'min_iteration_len')
  JsonObject? get minIterationLen;

  @BuiltValueField(wireName: r'min_watch_count')
  JsonObject? get minWatchCount;

  @BuiltValueField(wireName: r'known_term_part')
  JsonObject? get knownTermPart;

  @BuiltValueField(wireName: r'choices_count')
  JsonObject? get choicesCount;

  @BuiltValueField(wireName: r'is_learnt')
  JsonObject? get isLearnt;

  @BuiltValueField(wireName: r'personal_created_at')
  JsonObject? get personalCreatedAt;

  @BuiltValueField(wireName: r'personal_updated_at')
  JsonObject? get personalUpdatedAt;

  @BuiltValueField(wireName: r'name')
  JsonObject? get name;

  @BuiltValueField(wireName: r'description')
  JsonObject? get description;

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

  PersonalizeModuleDTO._();

  factory PersonalizeModuleDTO([void updates(PersonalizeModuleDTOBuilder b)]) = _$PersonalizeModuleDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PersonalizeModuleDTOBuilder b) => b
      ..description = JsonObject("");

  @BuiltValueSerializer(custom: true)
  static Serializer<PersonalizeModuleDTO> get serializer => _$PersonalizeModuleDTOSerializer();
}

class _$PersonalizeModuleDTOSerializer implements PrimitiveSerializer<PersonalizeModuleDTO> {
  @override
  final Iterable<Type> types = const [PersonalizeModuleDTO, _$PersonalizeModuleDTO];

  @override
  final String wireName = r'PersonalizeModuleDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PersonalizeModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield object.userId == null ? null : serializers.serialize(
      object.userId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'is_reverse_definition_write';
    yield object.isReverseDefinitionWrite == null ? null : serializers.serialize(
      object.isReverseDefinitionWrite,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'standard_and_reverse_write';
    yield object.standardAndReverseWrite == null ? null : serializers.serialize(
      object.standardAndReverseWrite,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'is_reverse_definition_choice';
    yield object.isReverseDefinitionChoice == null ? null : serializers.serialize(
      object.isReverseDefinitionChoice,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'standard_and_reverse_choice';
    yield object.standardAndReverseChoice == null ? null : serializers.serialize(
      object.standardAndReverseChoice,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'max_iteration_len';
    yield object.maxIterationLen == null ? null : serializers.serialize(
      object.maxIterationLen,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'min_iteration_len';
    yield object.minIterationLen == null ? null : serializers.serialize(
      object.minIterationLen,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'min_watch_count';
    yield object.minWatchCount == null ? null : serializers.serialize(
      object.minWatchCount,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'known_term_part';
    yield object.knownTermPart == null ? null : serializers.serialize(
      object.knownTermPart,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'choices_count';
    yield object.choicesCount == null ? null : serializers.serialize(
      object.choicesCount,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'is_learnt';
    yield object.isLearnt == null ? null : serializers.serialize(
      object.isLearnt,
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
    yield r'name';
    yield object.name == null ? null : serializers.serialize(
      object.name,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'description';
    yield object.description == null ? null : serializers.serialize(
      object.description,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    PersonalizeModuleDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PersonalizeModuleDTOBuilder result,
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
        case r'is_reverse_definition_write':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.isReverseDefinitionWrite = valueDes;
          break;
        case r'standard_and_reverse_write':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.standardAndReverseWrite = valueDes;
          break;
        case r'is_reverse_definition_choice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.isReverseDefinitionChoice = valueDes;
          break;
        case r'standard_and_reverse_choice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.standardAndReverseChoice = valueDes;
          break;
        case r'max_iteration_len':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.maxIterationLen = valueDes;
          break;
        case r'min_iteration_len':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.minIterationLen = valueDes;
          break;
        case r'min_watch_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.minWatchCount = valueDes;
          break;
        case r'known_term_part':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.knownTermPart = valueDes;
          break;
        case r'choices_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.choicesCount = valueDes;
          break;
        case r'is_learnt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.isLearnt = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PersonalizeModuleDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PersonalizeModuleDTOBuilder();
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

