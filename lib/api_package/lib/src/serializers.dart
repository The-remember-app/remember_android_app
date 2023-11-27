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
import 'package:api_package/src/model/ans_additional_term_info_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_folder_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_info.dart';
import 'package:api_package/src/model/ans_learn_mark_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_additional_term_info_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_folder_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_only_personalize_part_folder_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_personalize_folder_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_personalize_module_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_personalize_term_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_sentence_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_term_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_uuid_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_module_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_only_personalize_part_folder_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_only_personalize_part_module_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_only_personalize_part_term_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_personalize_folder_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_personalize_module_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_personalize_term_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_sentence_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_term_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_token_b_error.dart';
import 'package:api_package/src/model/ans_user_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/auth_error.dart';
import 'package:api_package/src/model/b_error.dart';
import 'package:api_package/src/model/create_additional_term_info_dto.dart';
import 'package:api_package/src/model/create_folder_dto.dart';
import 'package:api_package/src/model/create_learn_mark_dto.dart';
import 'package:api_package/src/model/create_module_dto.dart';
import 'package:api_package/src/model/create_only_personalize_part_folder_dto.dart';
import 'package:api_package/src/model/create_only_personalize_part_module_dto.dart';
import 'package:api_package/src/model/create_only_personalize_part_term_dto.dart';
import 'package:api_package/src/model/create_sentence_dto.dart';
import 'package:api_package/src/model/create_term_dto.dart';
import 'package:api_package/src/model/create_user_dto.dart';
import 'package:api_package/src/model/err_only_auth_error.dart';
import 'package:api_package/src/model/err_only_http_validation_error_model.dart';
import 'package:api_package/src/model/err_only_literal.dart';
import 'package:api_package/src/model/err_only_literal_di.dart';
import 'package:api_package/src/model/err_only_not_found_error.dart';
import 'package:api_package/src/model/error_messages.dart';
import 'package:api_package/src/model/error_types.dart';
import 'package:api_package/src/model/folder_dto.dart';
import 'package:api_package/src/model/http_validation_error_model.dart';
import 'package:api_package/src/model/learn_mark_dto.dart';
import 'package:api_package/src/model/module_dto.dart';
import 'package:api_package/src/model/not_found_error.dart';
import 'package:api_package/src/model/only_personalize_part_folder_dto.dart';
import 'package:api_package/src/model/only_personalize_part_module_dto.dart';
import 'package:api_package/src/model/only_personalize_part_term_dto.dart';
import 'package:api_package/src/model/personalize_folder_dto.dart';
import 'package:api_package/src/model/personalize_module_dto.dart';
import 'package:api_package/src/model/personalize_term_dto.dart';
import 'package:api_package/src/model/sentence_dto.dart';
import 'package:api_package/src/model/term_dto.dart';
import 'package:api_package/src/model/token.dart';
import 'package:api_package/src/model/update_only_personalize_part_folder_dto.dart';
import 'package:api_package/src/model/update_only_personalize_part_module_dto.dart';
import 'package:api_package/src/model/update_only_personalize_part_term_dto.dart';
import 'package:api_package/src/model/user_dto.dart';
import 'package:api_package/src/model/validation_error_model.dart';
import 'package:api_package/src/model/watch_learn_type_enum.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddInfoTypeEnum,
  AdditionalTermInfoDTO,
  AnsAdditionalTermInfoDTOUnionBErrorNoneType,
  AnsFolderDTOUnionBErrorNoneType,
  AnsInfo,
  AnsLearnMarkDTOUnionBErrorNoneType,
  AnsListAdditionalTermInfoDTOUnionBErrorNoneType,
  AnsListFolderDTOUnionBErrorNoneType,
  AnsListOnlyPersonalizePartFolderDTOUnionBErrorNoneType,
  AnsListPersonalizeFolderDTOUnionBErrorNoneType,
  AnsListPersonalizeModuleDTOUnionBErrorNoneType,
  AnsListPersonalizeTermDTOUnionBErrorNoneType,
  AnsListSentenceDTOUnionBErrorNoneType,
  AnsListTermDTOUnionBErrorNoneType,
  AnsListUUIDUnionBErrorNoneType,
  AnsModuleDTOUnionBErrorNoneType,
  AnsOnlyPersonalizePartFolderDTOUnionBErrorNoneType,
  AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType,
  AnsOnlyPersonalizePartTermDTOUnionBErrorNoneType,
  AnsPersonalizeFolderDTOUnionBErrorNoneType,
  AnsPersonalizeModuleDTOUnionBErrorNoneType,
  AnsPersonalizeTermDTOUnionBErrorNoneType,
  AnsSentenceDTOUnionBErrorNoneType,
  AnsTermDTOUnionBErrorNoneType,
  AnsTokenBError,
  AnsUserDTOUnionBErrorNoneType,
  AuthError,
  BError,
  CreateAdditionalTermInfoDTO,
  CreateFolderDTO,
  CreateLearnMarkDTO,
  CreateModuleDTO,
  CreateOnlyPersonalizePartFolderDTO,
  CreateOnlyPersonalizePartModuleDTO,
  CreateOnlyPersonalizePartTermDTO,
  CreateSentenceDTO,
  CreateTermDTO,
  CreateUserDTO,
  ErrOnlyAuthError,
  ErrOnlyHTTPValidationErrorModel,
  ErrOnlyLiteral,
  ErrOnlyLiteralDI,
  ErrOnlyNotFoundError,
  ErrorMessages,
  ErrorTypes,
  FolderDTO,
  HTTPValidationErrorModel,
  LearnMarkDTO,
  ModuleDTO,
  NotFoundError,
  OnlyPersonalizePartFolderDTO,
  OnlyPersonalizePartModuleDTO,
  OnlyPersonalizePartTermDTO,
  PersonalizeFolderDTO,
  PersonalizeModuleDTO,
  PersonalizeTermDTO,
  SentenceDTO,
  TermDTO,
  Token,
  UpdateOnlyPersonalizePartFolderDTO,
  UpdateOnlyPersonalizePartModuleDTO,
  UpdateOnlyPersonalizePartTermDTO,
  UserDTO,
  ValidationErrorModel,
  WatchLearnTypeEnum,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
