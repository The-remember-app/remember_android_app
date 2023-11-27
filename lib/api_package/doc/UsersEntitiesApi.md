# api_package.api.UsersEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkUserCheckUserGet**](UsersEntitiesApi.md#checkusercheckuserget) | **GET** /user/check_user | Check User
[**createUserCreatePost**](UsersEntitiesApi.md#createusercreatepost) | **POST** /user/create | Create User
[**existUserExistGet**](UsersEntitiesApi.md#existuserexistget) | **GET** /user/exist | Exist User
[**readUsersMeMeGet**](UsersEntitiesApi.md#readusersmemeget) | **GET** /user/me/ | Read Users Me


# **checkUserCheckUserGet**
> AnsUserDTOUnionBErrorNoneType checkUserCheckUserGet(username, password)

Check User

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getUsersEntitiesApi();
final JsonObject username = ; // JsonObject | 
final JsonObject password = ; // JsonObject | 

try {
    final response = api.checkUserCheckUserGet(username, password);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersEntitiesApi->checkUserCheckUserGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | [**JsonObject**](.md)|  | 
 **password** | [**JsonObject**](.md)|  | 

### Return type

[**AnsUserDTOUnionBErrorNoneType**](AnsUserDTOUnionBErrorNoneType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUserCreatePost**
> AnsUserDTOUnionBErrorNoneType createUserCreatePost(createUserDTO)

Create User

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getUsersEntitiesApi();
final CreateUserDTO createUserDTO = ; // CreateUserDTO | 

try {
    final response = api.createUserCreatePost(createUserDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersEntitiesApi->createUserCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserDTO** | [**CreateUserDTO**](CreateUserDTO.md)|  | 

### Return type

[**AnsUserDTOUnionBErrorNoneType**](AnsUserDTOUnionBErrorNoneType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **existUserExistGet**
> JsonObject existUserExistGet(userId)

Exist User

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getUsersEntitiesApi();
final JsonObject userId = ; // JsonObject | 

try {
    final response = api.existUserExistGet(userId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersEntitiesApi->existUserExistGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | [**JsonObject**](.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **readUsersMeMeGet**
> AnsUserDTOUnionBErrorNoneType readUsersMeMeGet()

Read Users Me

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getUsersEntitiesApi();

try {
    final response = api.readUsersMeMeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersEntitiesApi->readUsersMeMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AnsUserDTOUnionBErrorNoneType**](AnsUserDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

