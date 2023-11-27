# api_package.api.FoldersEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFolderCreatePost**](FoldersEntitiesApi.md#createfoldercreatepost) | **POST** /folder/create | Create Folder
[**createPersonalizeFolderPersonalizeCreatePost**](FoldersEntitiesApi.md#createpersonalizefolderpersonalizecreatepost) | **POST** /folder/personalize/create | Create Personalize Folder
[**existFolderExistFolderIdGet**](FoldersEntitiesApi.md#existfolderexistfolderidget) | **GET** /folder/exist/{folder_id} | Exist Folder
[**existPersonalizeFolderPersonalizeExistFolderIdGet**](FoldersEntitiesApi.md#existpersonalizefolderpersonalizeexistfolderidget) | **GET** /folder/personalize/exist/{folder_id} | Exist Personalize Folder
[**getAllFoldersPersonalizeAllGet**](FoldersEntitiesApi.md#getallfolderspersonalizeallget) | **GET** /folder/personalize/all | Get All Folders
[**getOneFolderFolderIdGet**](FoldersEntitiesApi.md#getonefolderfolderidget) | **GET** /folder/{folder_id} | Get One Folder
[**getPersonalizeFolderPersonalizeFolderIdGet**](FoldersEntitiesApi.md#getpersonalizefolderpersonalizefolderidget) | **GET** /folder/personalize/{folder_id} | Get Personalize Folder
[**getPersonalizeSubFoldersPersonalizeFolderIdSubFoldersGet**](FoldersEntitiesApi.md#getpersonalizesubfolderspersonalizefolderidsubfoldersget) | **GET** /folder/personalize/{folder_id}/sub_folders | Get Personalize Sub Folders
[**getSubFoldersFolderIdSubFoldersGet**](FoldersEntitiesApi.md#getsubfoldersfolderidsubfoldersget) | **GET** /folder/{folder_id}/sub_folders | Get Sub Folders
[**updatePersonalizeFolderPersonalizeUpdateFolderIdPut**](FoldersEntitiesApi.md#updatepersonalizefolderpersonalizeupdatefolderidput) | **PUT** /folder/personalize/update/{folder_id} | Update Personalize Folder


# **createFolderCreatePost**
> AnsFolderDTOUnionBErrorNoneType createFolderCreatePost(createFolderDTO)

Create Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final CreateFolderDTO createFolderDTO = ; // CreateFolderDTO | 

try {
    final response = api.createFolderCreatePost(createFolderDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->createFolderCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createFolderDTO** | [**CreateFolderDTO**](CreateFolderDTO.md)|  | 

### Return type

[**AnsFolderDTOUnionBErrorNoneType**](AnsFolderDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalizeFolderPersonalizeCreatePost**
> AnsListOnlyPersonalizePartFolderDTOUnionBErrorNoneType createPersonalizeFolderPersonalizeCreatePost(createOnlyPersonalizePartFolderDTO)

Create Personalize Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final CreateOnlyPersonalizePartFolderDTO createOnlyPersonalizePartFolderDTO = ; // CreateOnlyPersonalizePartFolderDTO | 

try {
    final response = api.createPersonalizeFolderPersonalizeCreatePost(createOnlyPersonalizePartFolderDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->createPersonalizeFolderPersonalizeCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOnlyPersonalizePartFolderDTO** | [**CreateOnlyPersonalizePartFolderDTO**](CreateOnlyPersonalizePartFolderDTO.md)|  | 

### Return type

[**AnsListOnlyPersonalizePartFolderDTOUnionBErrorNoneType**](AnsListOnlyPersonalizePartFolderDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **existFolderExistFolderIdGet**
> JsonObject existFolderExistFolderIdGet(folderId, rootFolderId, authorId)

Exist Folder

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 
final JsonObject rootFolderId = ; // JsonObject | 
final JsonObject authorId = ; // JsonObject | 

try {
    final response = api.existFolderExistFolderIdGet(folderId, rootFolderId, authorId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->existFolderExistFolderIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 
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

# **existPersonalizeFolderPersonalizeExistFolderIdGet**
> JsonObject existPersonalizeFolderPersonalizeExistFolderIdGet(folderId, rootFolderId)

Exist Personalize Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 
final JsonObject rootFolderId = ; // JsonObject | 

try {
    final response = api.existPersonalizeFolderPersonalizeExistFolderIdGet(folderId, rootFolderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->existPersonalizeFolderPersonalizeExistFolderIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 
 **rootFolderId** | [**JsonObject**](.md)|  | [optional] 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllFoldersPersonalizeAllGet**
> AnsListPersonalizeFolderDTOUnionBErrorNoneType getAllFoldersPersonalizeAllGet(authorOnly, limit, offset, updatedAfter)

Get All Folders

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.

try {
    final response = api.getAllFoldersPersonalizeAllGet(authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getAllFoldersPersonalizeAllGet: $e\n');
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

[**AnsListPersonalizeFolderDTOUnionBErrorNoneType**](AnsListPersonalizeFolderDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneFolderFolderIdGet**
> AnsFolderDTOUnionBErrorNoneType getOneFolderFolderIdGet(folderId)

Get One Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 

try {
    final response = api.getOneFolderFolderIdGet(folderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getOneFolderFolderIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 

### Return type

[**AnsFolderDTOUnionBErrorNoneType**](AnsFolderDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalizeFolderPersonalizeFolderIdGet**
> AnsPersonalizeFolderDTOUnionBErrorNoneType getPersonalizeFolderPersonalizeFolderIdGet(folderId, authorOnly)

Get Personalize Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 
final JsonObject authorOnly = ; // JsonObject | 

try {
    final response = api.getPersonalizeFolderPersonalizeFolderIdGet(folderId, authorOnly);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getPersonalizeFolderPersonalizeFolderIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]

### Return type

[**AnsPersonalizeFolderDTOUnionBErrorNoneType**](AnsPersonalizeFolderDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalizeSubFoldersPersonalizeFolderIdSubFoldersGet**
> AnsListPersonalizeFolderDTOUnionBErrorNoneType getPersonalizeSubFoldersPersonalizeFolderIdSubFoldersGet(folderId, authorOnly, limit, offset, updatedAfter)

Get Personalize Sub Folders

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | Установите null для получения корневых папок
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.

try {
    final response = api.getPersonalizeSubFoldersPersonalizeFolderIdSubFoldersGet(folderId, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getPersonalizeSubFoldersPersonalizeFolderIdSubFoldersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)| Установите null для получения корневых папок | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет. | [optional] 

### Return type

[**AnsListPersonalizeFolderDTOUnionBErrorNoneType**](AnsListPersonalizeFolderDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubFoldersFolderIdSubFoldersGet**
> AnsListFolderDTOUnionBErrorNoneType getSubFoldersFolderIdSubFoldersGet(folderId, limit, offset, updatedAfter)

Get Sub Folders

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.

try {
    final response = api.getSubFoldersFolderIdSubFoldersGet(folderId, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getSubFoldersFolderIdSubFoldersGet: $e\n');
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

[**AnsListFolderDTOUnionBErrorNoneType**](AnsListFolderDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePersonalizeFolderPersonalizeUpdateFolderIdPut**
> AnsOnlyPersonalizePartFolderDTOUnionBErrorNoneType updatePersonalizeFolderPersonalizeUpdateFolderIdPut(folderId, updateOnlyPersonalizePartFolderDTO)

Update Personalize Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 
final UpdateOnlyPersonalizePartFolderDTO updateOnlyPersonalizePartFolderDTO = ; // UpdateOnlyPersonalizePartFolderDTO | 

try {
    final response = api.updatePersonalizeFolderPersonalizeUpdateFolderIdPut(folderId, updateOnlyPersonalizePartFolderDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->updatePersonalizeFolderPersonalizeUpdateFolderIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 
 **updateOnlyPersonalizePartFolderDTO** | [**UpdateOnlyPersonalizePartFolderDTO**](UpdateOnlyPersonalizePartFolderDTO.md)|  | 

### Return type

[**AnsOnlyPersonalizePartFolderDTOUnionBErrorNoneType**](AnsOnlyPersonalizePartFolderDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

