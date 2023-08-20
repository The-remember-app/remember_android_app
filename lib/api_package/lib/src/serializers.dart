//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:api_package/src/date_serializer.dart';
import 'package:api_package/src/model/date.dart';

import 'package:api_package/src/model/add_info_type_enum.dart';
import 'package:api_package/src/model/additional_term_info_dto.dart';
import 'package:api_package/src/model/create_additional_term_info_as_tree_dto.dart';
import 'package:api_package/src/model/create_folder_as_tree_dto.dart';
import 'package:api_package/src/model/create_folder_dto.dart';
import 'package:api_package/src/model/create_module_as_tree_dto.dart';
import 'package:api_package/src/model/create_module_dto.dart';
import 'package:api_package/src/model/create_sentence_as_tree_dto.dart';
import 'package:api_package/src/model/create_sentence_dto.dart';
import 'package:api_package/src/model/create_term_as_tree_dto.dart';
import 'package:api_package/src/model/create_term_dto.dart';
import 'package:api_package/src/model/create_user_dto.dart';
import 'package:api_package/src/model/folder_dto.dart';
import 'package:api_package/src/model/folder_with_nested_entities_dto.dart';
import 'package:api_package/src/model/folder_with_root_entity_dto.dart';
import 'package:api_package/src/model/http_validation_error.dart';
import 'package:api_package/src/model/module_dto.dart';
import 'package:api_package/src/model/module_with_nested_entities_dto.dart';
import 'package:api_package/src/model/personalize_folder_dto.dart';
import 'package:api_package/src/model/personalize_module_dto.dart';
import 'package:api_package/src/model/personalize_term_dto.dart';
import 'package:api_package/src/model/personalize_term_with_add_info_dto.dart';
import 'package:api_package/src/model/sentence_dto.dart';
import 'package:api_package/src/model/term_dto.dart';
import 'package:api_package/src/model/token.dart';
import 'package:api_package/src/model/user_dto.dart';
import 'package:api_package/src/model/validation_error.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddInfoTypeEnum,
  AdditionalTermInfoDTO,
  CreateAdditionalTermInfoAsTreeDTO,
  CreateFolderAsTreeDTO,
  CreateFolderDTO,
  CreateModuleAsTreeDTO,
  CreateModuleDTO,
  CreateSentenceAsTreeDTO,
  CreateSentenceDTO,
  CreateTermAsTreeDTO,
  CreateTermDTO,
  CreateUserDTO,
  FolderDTO,
  FolderWithNestedEntitiesDTO,
  FolderWithRootEntityDTO,
  HTTPValidationError,
  ModuleDTO,
  ModuleWithNestedEntitiesDTO,
  PersonalizeFolderDTO,
  PersonalizeModuleDTO,
  PersonalizeTermDTO,
  PersonalizeTermWithAddInfoDTO,
  SentenceDTO,
  TermDTO,
  Token,
  UserDTO,
  ValidationError,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
