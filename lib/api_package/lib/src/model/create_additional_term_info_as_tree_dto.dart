//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_package/src/model/add_info_type_enum.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_additional_term_info_as_tree_dto.g.dart';

/// CreateAdditionalTermInfoAsTreeDTO
///
/// Properties:
/// * [textData] 
/// * [addingTextData] 
/// * [dialectOrArea] 
/// * [addInfoType] 
/// * [parentAddInfoId] 
/// * [termId] 
/// * [subAddInfoEntities] 
@BuiltValue()
abstract class CreateAdditionalTermInfoAsTreeDTO implements Built<CreateAdditionalTermInfoAsTreeDTO, CreateAdditionalTermInfoAsTreeDTOBuilder> {
  @BuiltValueField(wireName: r'text_data')
  JsonObject? get textData;

  @BuiltValueField(wireName: r'adding_text_data')
  JsonObject? get addingTextData;

  @BuiltValueField(wireName: r'dialect_or_area')
  JsonObject? get dialectOrArea;

  @BuiltValueField(wireName: r'add_info_type')
  AddInfoTypeEnum? get addInfoType;
  // enum addInfoTypeEnum {  usual_term,  other_form,  help_phrase_with_word,  help_phrase_without_word,  abbreviation,  composite_word,  sound,  transcription,  };

  @BuiltValueField(wireName: r'parent_add_info_id')
  JsonObject? get parentAddInfoId;

  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  @BuiltValueField(wireName: r'sub_add_info_entities')
  JsonObject? get subAddInfoEntities;

  CreateAdditionalTermInfoAsTreeDTO._();

  factory CreateAdditionalTermInfoAsTreeDTO([void updates(CreateAdditionalTermInfoAsTreeDTOBuilder b)]) = _$CreateAdditionalTermInfoAsTreeDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAdditionalTermInfoAsTreeDTOBuilder b) => b
      ..addInfoType = null;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAdditionalTermInfoAsTreeDTO> get serializer => _$CreateAdditionalTermInfoAsTreeDTOSerializer();
}

class _$CreateAdditionalTermInfoAsTreeDTOSerializer implements PrimitiveSerializer<CreateAdditionalTermInfoAsTreeDTO> {
  @override
  final Iterable<Type> types = const [CreateAdditionalTermInfoAsTreeDTO, _$CreateAdditionalTermInfoAsTreeDTO];

  @override
  final String wireName = r'CreateAdditionalTermInfoAsTreeDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAdditionalTermInfoAsTreeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'text_data';
    yield object.textData == null ? null : serializers.serialize(
      object.textData,
      specifiedType: const FullType.nullable(JsonObject),
    );
    if (object.addingTextData != null) {
      yield r'adding_text_data';
      yield serializers.serialize(
        object.addingTextData,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.dialectOrArea != null) {
      yield r'dialect_or_area';
      yield serializers.serialize(
        object.dialectOrArea,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.addInfoType != null) {
      yield r'add_info_type';
      yield serializers.serialize(
        object.addInfoType,
        specifiedType: const FullType(AddInfoTypeEnum),
      );
    }
    if (object.parentAddInfoId != null) {
      yield r'parent_add_info_id';
      yield serializers.serialize(
        object.parentAddInfoId,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.termId != null) {
      yield r'term_id';
      yield serializers.serialize(
        object.termId,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.subAddInfoEntities != null) {
      yield r'sub_add_info_entities';
      yield serializers.serialize(
        object.subAddInfoEntities,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateAdditionalTermInfoAsTreeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateAdditionalTermInfoAsTreeDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'text_data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.textData = valueDes;
          break;
        case r'adding_text_data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.addingTextData = valueDes;
          break;
        case r'dialect_or_area':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.dialectOrArea = valueDes;
          break;
        case r'add_info_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AddInfoTypeEnum),
          ) as AddInfoTypeEnum;
          result.addInfoType = valueDes.toBuilder();
          break;
        case r'parent_add_info_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.parentAddInfoId = valueDes;
          break;
        case r'term_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.termId = valueDes;
          break;
        case r'sub_add_info_entities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.subAddInfoEntities = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateAdditionalTermInfoAsTreeDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAdditionalTermInfoAsTreeDTOBuilder();
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

