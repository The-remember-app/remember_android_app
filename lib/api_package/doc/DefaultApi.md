# api_package.api.DefaultApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFolderFolderCreateAsTreePost**](DefaultApi.md#createfolderfoldercreateastreepost) | **POST** /folder/create/as_tree | Create Folder
[**createFolderFolderCreatePost**](DefaultApi.md#createfolderfoldercreatepost) | **POST** /folder/create | Create Folder
[**createModuleModuleCreatePost**](DefaultApi.md#createmodulemodulecreatepost) | **POST** /module/create | Create Module
[**createTermTermCreatePost**](DefaultApi.md#createtermtermcreatepost) | **POST** /term/create | Create Term
[**createUserUserCreatePost**](DefaultApi.md#createuserusercreatepost) | **POST** /user/create | Create User
[**getAllFoldersFolderAllAsTreeGet**](DefaultApi.md#getallfoldersfolderallastreeget) | **GET** /folder/all/as_tree | Get All Folders
[**getAllFoldersFolderAllGet**](DefaultApi.md#getallfoldersfolderallget) | **GET** /folder/all | Get All Folders
[**getAllModuleModuleAllGet**](DefaultApi.md#getallmodulemoduleallget) | **GET** /module/all | Get All Module
[**getAllTermTermAllGet**](DefaultApi.md#getalltermtermallget) | **GET** /term/all | Get All Term
[**getOneFolderFolderFolderIdAsTreeGet**](DefaultApi.md#getonefolderfolderfolderidastreeget) | **GET** /folder/{folder_id}/as_tree | Get One Folder
[**getOneFolderFolderFolderIdGet**](DefaultApi.md#getonefolderfolderfolderidget) | **GET** /folder/{folder_id} | Get One Folder
[**getOneFolderFolderFolderIdWithParentGet**](DefaultApi.md#getonefolderfolderfolderidwithparentget) | **GET** /folder/{folder_id}/with_parent | Get One Folder
[**getOneModuleModuleModuleIdGet**](DefaultApi.md#getonemodulemodulemoduleidget) | **GET** /module/{module_id} | Get One Module
[**getOneTermTermTermIdGet**](DefaultApi.md#getonetermtermtermidget) | **GET** /term/{term_id} | Get One Term
[**loginForAccessTokenAuthTokenPost**](DefaultApi.md#loginforaccesstokenauthtokenpost) | **POST** /auth/token | Login For Access Token
[**readUsersMeUserMeGet**](DefaultApi.md#readusersmeusermeget) | **GET** /user/me/ | Read Users Me


# **createFolderFolderCreateAsTreePost**
> JsonObject createFolderFolderCreateAsTreePost(body)

Create Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final JsonObject body = ; // JsonObject | 

try {
    final response = api.createFolderFolderCreateAsTreePost(body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->createFolderFolderCreateAsTreePost: $e\n');
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

final api = ApiPackage().getDefaultApi();
final CreateFolderDTO createFolderDTO = ; // CreateFolderDTO | 

try {
    final response = api.createFolderFolderCreatePost(createFolderDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->createFolderFolderCreatePost: $e\n');
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

# **createModuleModuleCreatePost**
> ModuleDTO createModuleModuleCreatePost(createModuleDTO)

Create Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final CreateModuleDTO createModuleDTO = ; // CreateModuleDTO | 

try {
    final response = api.createModuleModuleCreatePost(createModuleDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->createModuleModuleCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createModuleDTO** | [**CreateModuleDTO**](CreateModuleDTO.md)|  | 

### Return type

[**ModuleDTO**](ModuleDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createTermTermCreatePost**
> TermDTO createTermTermCreatePost(createTermDTO)

Create Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final CreateTermDTO createTermDTO = ; // CreateTermDTO | 

try {
    final response = api.createTermTermCreatePost(createTermDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->createTermTermCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createTermDTO** | [**CreateTermDTO**](CreateTermDTO.md)|  | 

### Return type

[**TermDTO**](TermDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUserUserCreatePost**
> UserDTO createUserUserCreatePost(createUserDTO)

Create User

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getDefaultApi();
final CreateUserDTO createUserDTO = ; // CreateUserDTO | 

try {
    final response = api.createUserUserCreatePost(createUserDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->createUserUserCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserDTO** | [**CreateUserDTO**](CreateUserDTO.md)|  | 

### Return type

[**UserDTO**](UserDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllFoldersFolderAllAsTreeGet**
> JsonObject getAllFoldersFolderAllAsTreeGet()

Get All Folders

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();

try {
    final response = api.getAllFoldersFolderAllAsTreeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getAllFoldersFolderAllAsTreeGet: $e\n');
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

final api = ApiPackage().getDefaultApi();

try {
    final response = api.getAllFoldersFolderAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getAllFoldersFolderAllGet: $e\n');
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

# **getAllModuleModuleAllGet**
> JsonObject getAllModuleModuleAllGet()

Get All Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();

try {
    final response = api.getAllModuleModuleAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getAllModuleModuleAllGet: $e\n');
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

# **getAllTermTermAllGet**
> JsonObject getAllTermTermAllGet()

Get All Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();

try {
    final response = api.getAllTermTermAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getAllTermTermAllGet: $e\n');
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

# **getOneFolderFolderFolderIdAsTreeGet**
> FolderWithNestedEntitiesDTO getOneFolderFolderFolderIdAsTreeGet(folderId)

Get One Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final JsonObject folderId = ; // JsonObject | 

try {
    final response = api.getOneFolderFolderFolderIdAsTreeGet(folderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getOneFolderFolderFolderIdAsTreeGet: $e\n');
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

final api = ApiPackage().getDefaultApi();
final JsonObject folderId = ; // JsonObject | 

try {
    final response = api.getOneFolderFolderFolderIdGet(folderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getOneFolderFolderFolderIdGet: $e\n');
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

# **getOneFolderFolderFolderIdWithParentGet**
> FolderWithRootEntityDTO getOneFolderFolderFolderIdWithParentGet(folderId)

Get One Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final JsonObject folderId = ; // JsonObject | 

try {
    final response = api.getOneFolderFolderFolderIdWithParentGet(folderId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getOneFolderFolderFolderIdWithParentGet: $e\n');
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

# **getOneModuleModuleModuleIdGet**
> PersonalizeModuleDTO getOneModuleModuleModuleIdGet(moduleId)

Get One Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final JsonObject moduleId = ; // JsonObject | 

try {
    final response = api.getOneModuleModuleModuleIdGet(moduleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getOneModuleModuleModuleIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 

### Return type

[**PersonalizeModuleDTO**](PersonalizeModuleDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneTermTermTermIdGet**
> PersonalizeTermDTO getOneTermTermTermIdGet(termId)

Get One Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final JsonObject termId = ; // JsonObject | 

try {
    final response = api.getOneTermTermTermIdGet(termId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getOneTermTermTermIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **termId** | [**JsonObject**](.md)|  | 

### Return type

[**PersonalizeTermDTO**](PersonalizeTermDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginForAccessTokenAuthTokenPost**
> Token loginForAccessTokenAuthTokenPost(username, password, grantType, scope, clientId, clientSecret)

Login For Access Token

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getDefaultApi();
final JsonObject username = ; // JsonObject | 
final JsonObject password = ; // JsonObject | 
final JsonObject grantType = ; // JsonObject | 
final JsonObject scope = ; // JsonObject | 
final JsonObject clientId = ; // JsonObject | 
final JsonObject clientSecret = ; // JsonObject | 

try {
    final response = api.loginForAccessTokenAuthTokenPost(username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->loginForAccessTokenAuthTokenPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | [**JsonObject**](JsonObject.md)|  | 
 **password** | [**JsonObject**](JsonObject.md)|  | 
 **grantType** | [**JsonObject**](JsonObject.md)|  | [optional] 
 **scope** | [**JsonObject**](JsonObject.md)|  | [optional] [default to ]
 **clientId** | [**JsonObject**](JsonObject.md)|  | [optional] 
 **clientSecret** | [**JsonObject**](JsonObject.md)|  | [optional] 

### Return type

[**Token**](Token.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readUsersMeUserMeGet**
> UserDTO readUsersMeUserMeGet()

Read Users Me

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();

try {
    final response = api.readUsersMeUserMeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->readUsersMeUserMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserDTO**](UserDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

