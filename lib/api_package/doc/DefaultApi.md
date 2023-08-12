# api_package.api.DefaultApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFolderFolderCreatePost**](DefaultApi.md#createfolderfoldercreatepost) | **POST** /folder/create | Create Folder
[**createFolderModuleCreatePost**](DefaultApi.md#createfoldermodulecreatepost) | **POST** /module/create | Create Folder
[**createFolderTermCreatePost**](DefaultApi.md#createfoldertermcreatepost) | **POST** /term/create | Create Folder
[**createUserUserCreatePost**](DefaultApi.md#createuserusercreatepost) | **POST** /user/create | Create User
[**getAllFoldersFolderAllGet**](DefaultApi.md#getallfoldersfolderallget) | **GET** /folder/all | Get All Folders
[**getAllFoldersModuleAllGet**](DefaultApi.md#getallfoldersmoduleallget) | **GET** /module/all | Get All Folders
[**getAllFoldersTermAllGet**](DefaultApi.md#getallfolderstermallget) | **GET** /term/all | Get All Folders
[**getOneFolderFolderFolderIdGet**](DefaultApi.md#getonefolderfolderfolderidget) | **GET** /folder/{folder_id} | Get One Folder
[**getOneFolderModuleModuleIdGet**](DefaultApi.md#getonefoldermodulemoduleidget) | **GET** /module/{module_id} | Get One Folder
[**getOneFolderTermTermIdGet**](DefaultApi.md#getonefoldertermtermidget) | **GET** /term/{term_id} | Get One Folder
[**loginForAccessTokenAuthTokenPost**](DefaultApi.md#loginforaccesstokenauthtokenpost) | **POST** /auth/token | Login For Access Token
[**readUsersMeUserMeGet**](DefaultApi.md#readusersmeusermeget) | **GET** /user/me/ | Read Users Me


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

# **createFolderModuleCreatePost**
> ModuleDTO createFolderModuleCreatePost(createModuleDTO)

Create Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final CreateModuleDTO createModuleDTO = ; // CreateModuleDTO | 

try {
    final response = api.createFolderModuleCreatePost(createModuleDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->createFolderModuleCreatePost: $e\n');
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

# **createFolderTermCreatePost**
> TermDTO createFolderTermCreatePost(createTermDTO)

Create Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final CreateTermDTO createTermDTO = ; // CreateTermDTO | 

try {
    final response = api.createFolderTermCreatePost(createTermDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->createFolderTermCreatePost: $e\n');
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

# **getAllFoldersModuleAllGet**
> JsonObject getAllFoldersModuleAllGet()

Get All Folders

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();

try {
    final response = api.getAllFoldersModuleAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getAllFoldersModuleAllGet: $e\n');
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

# **getAllFoldersTermAllGet**
> JsonObject getAllFoldersTermAllGet()

Get All Folders

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();

try {
    final response = api.getAllFoldersTermAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getAllFoldersTermAllGet: $e\n');
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

# **getOneFolderModuleModuleIdGet**
> PersonalizeModuleDTO getOneFolderModuleModuleIdGet(moduleId)

Get One Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final JsonObject moduleId = ; // JsonObject | 

try {
    final response = api.getOneFolderModuleModuleIdGet(moduleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getOneFolderModuleModuleIdGet: $e\n');
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

# **getOneFolderTermTermIdGet**
> PersonalizeTermDTO getOneFolderTermTermIdGet(termId)

Get One Folder

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getDefaultApi();
final JsonObject termId = ; // JsonObject | 

try {
    final response = api.getOneFolderTermTermIdGet(termId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getOneFolderTermTermIdGet: $e\n');
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

