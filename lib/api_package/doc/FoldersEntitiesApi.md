# api_package.api.FoldersEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFolderAsTreeFolderCreateAsTreePost**](FoldersEntitiesApi.md#createfolderastreefoldercreateastreepost) | **POST** /folder/create/as_tree | Create Folder As Tree
[**createFolderFolderCreatePost**](FoldersEntitiesApi.md#createfolderfoldercreatepost) | **POST** /folder/create | Create Folder
[**deletePersonalizeFolderFolderPersonalizeDeleteDelete**](FoldersEntitiesApi.md#deletepersonalizefolderfolderpersonalizedeletedelete) | **DELETE** /folder/personalize/delete | Delete Personalize Folder
[**getAllFoldersAsTreeFolderAllAsTreeGet**](FoldersEntitiesApi.md#getallfoldersastreefolderallastreeget) | **GET** /folder/all/as_tree | Get All Folders As Tree
[**getAllFoldersFolderAllGet**](FoldersEntitiesApi.md#getallfoldersfolderallget) | **GET** /folder/all | Get All Folders
[**getOneFolderAsTreeFolderFolderIdAsTreeGet**](FoldersEntitiesApi.md#getonefolderastreefolderfolderidastreeget) | **GET** /folder/{folder_id}/as_tree | Get One Folder As Tree
[**getOneFolderFolderFolderIdGet**](FoldersEntitiesApi.md#getonefolderfolderfolderidget) | **GET** /folder/{folder_id} | Get One Folder
[**getOneFolderWithParentsFolderFolderIdWithParentGet**](FoldersEntitiesApi.md#getonefolderwithparentsfolderfolderidwithparentget) | **GET** /folder/{folder_id}/with_parent | Get One Folder With Parents
[**updatePersonalizeFolderFolderPersonalizeCreateOrUpdatePut**](FoldersEntitiesApi.md#updatepersonalizefolderfolderpersonalizecreateorupdateput) | **PUT** /folder/personalize/create_or_update | Update Personalize Folder


# **createFolderAsTreeFolderCreateAsTreePost**
> JsonObject createFolderAsTreeFolderCreateAsTreePost(body)

Create Folder As Tree

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject body = ; // JsonObject | 

try {
    final response = api.createFolderAsTreeFolderCreateAsTreePost(body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->createFolderAsTreeFolderCreateAsTreePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **JsonObject**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createFolderFolderCreatePost**
> FolderDTO createFolderFolderCreatePost(createFolderDTO)

Create Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final CreateFolderDTO createFolderDTO = ; // CreateFolderDTO | 

try {
    final response = api.createFolderFolderCreatePost(createFolderDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->createFolderFolderCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createFolderDTO** | [**CreateFolderDTO**](CreateFolderDTO.md)|  | 

### Return type

[**FolderDTO**](FolderDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePersonalizeFolderFolderPersonalizeDeleteDelete**
> JsonObject deletePersonalizeFolderFolderPersonalizeDeleteDelete(body)

Delete Personalize Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject body = ; // JsonObject | 

try {
    final response = api.deletePersonalizeFolderFolderPersonalizeDeleteDelete(body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->deletePersonalizeFolderFolderPersonalizeDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **JsonObject**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllFoldersAsTreeFolderAllAsTreeGet**
> JsonObject getAllFoldersAsTreeFolderAllAsTreeGet()

Get All Folders As Tree

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();

try {
    final response = api.getAllFoldersAsTreeFolderAllAsTreeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getAllFoldersAsTreeFolderAllAsTreeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllFoldersFolderAllGet**
> JsonObject getAllFoldersFolderAllGet()

Get All Folders

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();

try {
    final response = api.getAllFoldersFolderAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getAllFoldersFolderAllGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneFolderAsTreeFolderFolderIdAsTreeGet**
> FolderWithNestedEntitiesDTO getOneFolderAsTreeFolderFolderIdAsTreeGet(folderId)

Get One Folder As Tree

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 

try {
    final response = api.getOneFolderAsTreeFolderFolderIdAsTreeGet(folderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getOneFolderAsTreeFolderFolderIdAsTreeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 

### Return type

[**FolderWithNestedEntitiesDTO**](FolderWithNestedEntitiesDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneFolderFolderFolderIdGet**
> FolderDTO getOneFolderFolderFolderIdGet(folderId)

Get One Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 

try {
    final response = api.getOneFolderFolderFolderIdGet(folderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getOneFolderFolderFolderIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 

### Return type

[**FolderDTO**](FolderDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneFolderWithParentsFolderFolderIdWithParentGet**
> FolderWithRootEntityDTO getOneFolderWithParentsFolderFolderIdWithParentGet(folderId)

Get One Folder With Parents

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject folderId = ; // JsonObject | 

try {
    final response = api.getOneFolderWithParentsFolderFolderIdWithParentGet(folderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->getOneFolderWithParentsFolderFolderIdWithParentGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | [**JsonObject**](.md)|  | 

### Return type

[**FolderWithRootEntityDTO**](FolderWithRootEntityDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePersonalizeFolderFolderPersonalizeCreateOrUpdatePut**
> JsonObject updatePersonalizeFolderFolderPersonalizeCreateOrUpdatePut(body)

Update Personalize Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getFoldersEntitiesApi();
final JsonObject body = ; // JsonObject | 

try {
    final response = api.updatePersonalizeFolderFolderPersonalizeCreateOrUpdatePut(body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FoldersEntitiesApi->updatePersonalizeFolderFolderPersonalizeCreateOrUpdatePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **JsonObject**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

