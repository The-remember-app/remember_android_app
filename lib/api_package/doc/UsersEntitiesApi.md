# api_package.api.UsersEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUserUserCreatePost**](UsersEntitiesApi.md#createuserusercreatepost) | **POST** /user/create | Create User
[**readUsersMeUserMeGet**](UsersEntitiesApi.md#readusersmeusermeget) | **GET** /user/me/ | Read Users Me


# **createUserUserCreatePost**
> UserDTO createUserUserCreatePost(createUserDTO)

Create User

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getUsersEntitiesApi();
final CreateUserDTO createUserDTO = ; // CreateUserDTO | 

try {
    final response = api.createUserUserCreatePost(createUserDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersEntitiesApi->createUserUserCreatePost: $e\n');
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

# **readUsersMeUserMeGet**
> UserDTO readUsersMeUserMeGet()

Read Users Me

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getUsersEntitiesApi();

try {
    final response = api.readUsersMeUserMeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersEntitiesApi->readUsersMeUserMeGet: $e\n');
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

