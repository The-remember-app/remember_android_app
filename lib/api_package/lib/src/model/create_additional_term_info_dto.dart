//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_package/src/model/add_info_type_enum.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_additional_term_info_dto.g.dart';

/// CreateAdditionalTermInfoDTO
///
/// Properties:
/// * [textData] 
/// * [addingTextData] 
/// * [dialectOrArea] 
/// * [addInfoType] 
/// * [parentAddInfoId] 
/// * [termId] 
@BuiltValue()
abstract class CreateAdditionalTermInfoDTO implements Built<CreateAdditionalTermInfoDTO, CreateAdditionalTermInfoDTOBuilder> {
  @BuiltValueField(wireName: r'text_data')
  JsonObject? get textData;

  @BuiltValueField(wireName: r'adding_text_data')
  JsonObject? get addingTextData;

  @BuiltValueField(wireName: r'dialect_or_area')
  JsonObject? get dialectOrArea;

  @BuiltValueField(wireName: r'add_info_type')
  JsonObject? get addInfoType;
  // enum addInfoTypeEnum {  usual_term,  other_form,  help_phrase_with_word,  help_phrase_without_word,  dialect_or_area,  abbreviation,  composite_word,  unary_word,  sound,  transcription,  };

  @BuiltValueField(wireName: r'parent_add_info_id')
  JsonObject? get parentAddInfoId;

  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  CreateAdditionalTermInfoDTO._();

  factory CreateAdditionalTermInfoDTO([void updates(CreateAdditionalTermInfoDTOBuilder b)]) = _$CreateAdditionalTermInfoDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAdditionalTermInfoDTOBuilder b) => b
      ..addInfoType = JsonObject( "usual_term");

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAdditionalTermInfoDTO> get serializer => _$CreateAdditionalTermInfoDTOSerializer();
}

class _$CreateAdditionalTermInfoDTOSerializer implements PrimitiveSerializer<CreateAdditionalTermInfoDTO> {
  @override
  final Iterable<Type> types = const [CreateAdditionalTermInfoDTO, _$CreateAdditionalTermInfoDTO];

  @override
  final String wireName = r'CreateAdditionalTermInfoDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAdditionalTermInfoDTO object, {
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
        specifiedType: const FullType(JsonObject),
      );
    }
    if (object.parentAddInfoId != null) {
      yield r'parent_add_info_id';
      yield serializers.serialize(
        object.parentAddInfoId,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    yield r'term_id';
    yield object.termId == null ? null : serializers.serialize(
      object.termId,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateAdditionalTermInfoDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateAdditionalTermInfoDTOBuilder result,
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
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateAdditionalTermInfoDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAdditionalTermInfoDTOBuilder();
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

