# api_package.api.ModuleEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createModuleCreatePost**](ModuleEntitiesApi.md#createmodulecreatepost) | **POST** /module/create | Create Module
[**createPersonalizeModulePersonalizeCreatePost**](ModuleEntitiesApi.md#createpersonalizemodulepersonalizecreatepost) | **POST** /module/personalize/create | Create Personalize Module
[**existModuleExistModuleIdGet**](ModuleEntitiesApi.md#existmoduleexistmoduleidget) | **GET** /module/exist/{module_id} | Exist Module
[**existPersonalizeModulePersonalizeExistGet**](ModuleEntitiesApi.md#existpersonalizemodulepersonalizeexistget) | **GET** /module/personalize/exist | Exist Personalize Module
[**getAllModulePersonalizeAllGet**](ModuleEntitiesApi.md#getallmodulepersonalizeallget) | **GET** /module/personalize/all | Get All Module
[**getAllModulePersonalizeFromFolderFolderIdGet**](ModuleEntitiesApi.md#getallmodulepersonalizefromfolderfolderidget) | **GET** /module/personalize/from_folder/{folder_id} | Get All Module
[**getModuleIdsFromFolderFromFolderFolderIdIdsOnlyGet**](ModuleEntitiesApi.md#getmoduleidsfromfolderfromfolderfolderididsonlyget) | **GET** /module/from_folder/{folder_id}/ids_only | Get Module Ids From Folder
[**getModulesFromFolderFromFolderFolderIdGet**](ModuleEntitiesApi.md#getmodulesfromfolderfromfolderfolderidget) | **GET** /module/from_folder/{folder_id} | Get Modules From Folder
[**getOneModuleModuleIdGet**](ModuleEntitiesApi.md#getonemodulemoduleidget) | **GET** /module/{module_id} | Get One Module
[**getOneModulePersonalizeModuleIdGet**](ModuleEntitiesApi.md#getonemodulepersonalizemoduleidget) | **GET** /module/personalize/{module_id} | Get One Module
[**updatePersonalizeModulePersonalizeUpdateModuleIdPut**](ModuleEntitiesApi.md#updatepersonalizemodulepersonalizeupdatemoduleidput) | **PUT** /module/personalize/update/{module_id} | Update Personalize Module


# **createModuleCreatePost**
> AnsModuleDTOUnionBErrorNoneType createModuleCreatePost(createModuleDTO)

Create Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final CreateModuleDTO createModuleDTO = ; // CreateModuleDTO | 

try {
    final response = api.createModuleCreatePost(createModuleDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->createModuleCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createModuleDTO** | [**CreateModuleDTO**](CreateModuleDTO.md)|  | 

### Return type

[**AnsModuleDTOUnionBErrorNoneType**](AnsModuleDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalizeModulePersonalizeCreatePost**
> AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType createPersonalizeModulePersonalizeCreatePost(createOnlyPersonalizePartModuleDTO, fromFolderMicroservice)

Create Personalize Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final CreateOnlyPersonalizePartModuleDTO createOnlyPersonalizePartModuleDTO = ; // CreateOnlyPersonalizePartModuleDTO | 
final JsonObject fromFolderMicroservice = ; // JsonObject | Костыль, при переписывании взаимодействия с использованием Саги будет удалён

try {
    final response = api.createPersonalizeModulePersonalizeCreatePost(createOnlyPersonalizePartModuleDTO, fromFolderMicroservice);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->createPersonalizeModulePersonalizeCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOnlyPersonalizePartModuleDTO** | [**CreateOnlyPersonalizePartModuleDTO**](CreateOnlyPersonalizePartModuleDTO.md)|  | 
 **fromFolderMicroservice** | [**JsonObject**](.md)| Костыль, при переписывании взаимодействия с использованием Саги будет удалён | [optional] 

### Return type

[**AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType**](AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **existModuleExistModuleIdGet**
> JsonObject existModuleExistModuleIdGet(moduleId, rootFolderId, authorId)

Exist Module

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 
final JsonObject rootFolderId = ; // JsonObject | 
final JsonObject authorId = ; // JsonObject | 

try {
    final response = api.existModuleExistModuleIdGet(moduleId, rootFolderId, authorId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->existModuleExistModuleIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 
 **rootFolderId** | [**JsonObject**](.md)|  | [optional] 
 **authorId** | [**JsonObject**](.md)|  | [optional] 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **existPersonalizeModulePersonalizeExistGet**
> JsonObject existPersonalizeModulePersonalizeExistGet(moduleId, rootFolderId)

Exist Personalize Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 
final JsonObject rootFolderId = ; // JsonObject | 

try {
    final response = api.existPersonalizeModulePersonalizeExistGet(moduleId, rootFolderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->existPersonalizeModulePersonalizeExistGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 
 **rootFolderId** | [**JsonObject**](.md)|  | [optional] 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllModulePersonalizeAllGet**
> AnsListPersonalizeModuleDTOUnionBErrorNoneType getAllModulePersonalizeAllGet(authorOnly, limit, offset, updatedAfter)

Get All Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.

try {
    final response = api.getAllModulePersonalizeAllGet(authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->getAllModulePersonalizeAllGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет. | [optional] 

### Return type

[**AnsListPersonalizeModuleDTOUnionBErrorNoneType**](AnsListPersonalizeModuleDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllModulePersonalizeFromFolderFolderIdGet**
> AnsListPersonalizeModuleDTOUnionBErrorNoneType getAllModulePersonalizeFromFolderFolderIdGet(folderId, authorOnly, limit, offset, updatedAfter)

Get All Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject folderId = ; // JsonObject | Установите null для получения корневых модулей
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.

try {
    final response = api.getAllModulePersonalizeFromFolderFolderIdGet(folderId, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->getAllModulePersonalizeFromFolderFolderIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)| Установите null для получения корневых модулей | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет. | [optional] 

### Return type

[**AnsListPersonalizeModuleDTOUnionBErrorNoneType**](AnsListPersonalizeModuleDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getModuleIdsFromFolderFromFolderFolderIdIdsOnlyGet**
> AnsListUUIDUnionBErrorNoneType getModuleIdsFromFolderFromFolderFolderIdIdsOnlyGet(folderId)

Get Module Ids From Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject folderId = ; // JsonObject | 

try {
    final response = api.getModuleIdsFromFolderFromFolderFolderIdIdsOnlyGet(folderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->getModuleIdsFromFolderFromFolderFolderIdIdsOnlyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 

### Return type

[**AnsListUUIDUnionBErrorNoneType**](AnsListUUIDUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getModulesFromFolderFromFolderFolderIdGet**
> AnsListUUIDUnionBErrorNoneType getModulesFromFolderFromFolderFolderIdGet(folderId, limit, offset, updatedAfter)

Get Modules From Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject folderId = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.

try {
    final response = api.getModulesFromFolderFromFolderFolderIdGet(folderId, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->getModulesFromFolderFromFolderFolderIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет. | [optional] 

### Return type

[**AnsListUUIDUnionBErrorNoneType**](AnsListUUIDUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneModuleModuleIdGet**
> AnsModuleDTOUnionBErrorNoneType getOneModuleModuleIdGet(moduleId)

Get One Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 

try {
    final response = api.getOneModuleModuleIdGet(moduleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->getOneModuleModuleIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 

### Return type

[**AnsModuleDTOUnionBErrorNoneType**](AnsModuleDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneModulePersonalizeModuleIdGet**
> AnsPersonalizeModuleDTOUnionBErrorNoneType getOneModulePersonalizeModuleIdGet(moduleId)

Get One Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 

try {
    final response = api.getOneModulePersonalizeModuleIdGet(moduleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->getOneModulePersonalizeModuleIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 

### Return type

[**AnsPersonalizeModuleDTOUnionBErrorNoneType**](AnsPersonalizeModuleDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePersonalizeModulePersonalizeUpdateModuleIdPut**
> AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType updatePersonalizeModulePersonalizeUpdateModuleIdPut(moduleId, updateOnlyPersonalizePartModuleDTO)

Update Personalize Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 
final UpdateOnlyPersonalizePartModuleDTO updateOnlyPersonalizePartModuleDTO = ; // UpdateOnlyPersonalizePartModuleDTO | 

try {
    final response = api.updatePersonalizeModulePersonalizeUpdateModuleIdPut(moduleId, updateOnlyPersonalizePartModuleDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->updatePersonalizeModulePersonalizeUpdateModuleIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 
 **updateOnlyPersonalizePartModuleDTO** | [**UpdateOnlyPersonalizePartModuleDTO**](UpdateOnlyPersonalizePartModuleDTO.md)|  | 

### Return type

[**AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType**](AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

