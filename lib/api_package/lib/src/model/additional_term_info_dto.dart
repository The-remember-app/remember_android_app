//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_package/src/model/add_info_type_enum.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'additional_term_info_dto.g.dart';

/// AdditionalTermInfoDTO
///
/// Properties:
/// * [textData] 
/// * [addingTextData] 
/// * [dialectOrArea] 
/// * [addInfoType] 
/// * [parentAddInfoId] 
/// * [termId] 
/// * [id] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class AdditionalTermInfoDTO implements Built<AdditionalTermInfoDTO, AdditionalTermInfoDTOBuilder> {
  @BuiltValueField(wireName: r'text_data')
  JsonObject? get textData;

  @BuiltValueField(wireName: r'adding_text_data')
  JsonObject? get addingTextData;

  @BuiltValueField(wireName: r'dialect_or_area')
  JsonObject? get dialectOrArea;

  @BuiltValueField(wireName: r'add_info_type')
  JsonObject? get addInfoType;
  // enum addInfoTypeEnum {  usual_term,  other_form,  help_phrase_with_word,  help_phrase_without_word,  abbreviation,  composite_word,  sound,  transcription,  };

  @BuiltValueField(wireName: r'parent_add_info_id')
  JsonObject? get parentAddInfoId;

  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  @BuiltValueField(wireName: r'id')
  JsonObject? get id;

  @BuiltValueField(wireName: r'created_at')
  JsonObject? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  JsonObject? get updatedAt;

  AdditionalTermInfoDTO._();

  factory AdditionalTermInfoDTO([void updates(AdditionalTermInfoDTOBuilder b)]) = _$AdditionalTermInfoDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdditionalTermInfoDTOBuilder b) => b
      ..addInfoType = null;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdditionalTermInfoDTO> get serializer => _$AdditionalTermInfoDTOSerializer();
}

class _$AdditionalTermInfoDTOSerializer implements PrimitiveSerializer<AdditionalTermInfoDTO> {
  @override
  final Iterable<Type> types = const [AdditionalTermInfoDTO, _$AdditionalTermInfoDTO];

  @override
  final String wireName = r'AdditionalTermInfoDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdditionalTermInfoDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'text_data';
    yield object.textData == null ? null : serializers.serialize(
      object.textData,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'adding_text_data';
    yield object.addingTextData == null ? null : serializers.serialize(
      object.addingTextData,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'dialect_or_area';
    yield object.dialectOrArea == null ? null : serializers.serialize(
      object.dialectOrArea,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'add_info_type';
    yield serializers.serialize(
      object.addInfoType,
      specifiedType: const FullType(AddInfoTypeEnum),
    );
    yield r'parent_add_info_id';
    yield object.parentAddInfoId == null ? null : serializers.serialize(
      object.parentAddInfoId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'term_id';
    yield object.termId == null ? null : serializers.serialize(
      object.termId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'id';
    yield object.id == null ? null : serializers.serialize(
      object.id,
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
    AdditionalTermInfoDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdditionalTermInfoDTOBuilder result,
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
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          result.addInfoType = valueDes;
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
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.id = valueDes;
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
  AdditionalTermInfoDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdditionalTermInfoDTOBuilder();
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

