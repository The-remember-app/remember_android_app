# api_package.api.ModuleEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createModuleModuleCreatePost**](ModuleEntitiesApi.md#createmodulemodulecreatepost) | **POST** /module/create | Create Module
[**getAllModuleModuleAllGet**](ModuleEntitiesApi.md#getallmodulemoduleallget) | **GET** /module/all | Get All Module
[**getOneModuleModuleModuleIdGet**](ModuleEntitiesApi.md#getonemodulemodulemoduleidget) | **GET** /module/{module_id} | Get One Module


# **createModuleModuleCreatePost**
> ModuleDTO createModuleModuleCreatePost(createModuleDTO)

Create Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final CreateModuleDTO createModuleDTO = ; // CreateModuleDTO | 

try {
    final response = api.createModuleModuleCreatePost(createModuleDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->createModuleModuleCreatePost: $e\n');
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

# **getAllModuleModuleAllGet**
> JsonObject getAllModuleModuleAllGet()

Get All Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();

try {
    final response = api.getAllModuleModuleAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->getAllModuleModuleAllGet: $e\n');
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

# **getOneModuleModuleModuleIdGet**
> PersonalizeModuleDTO getOneModuleModuleModuleIdGet(moduleId)

Get One Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 

try {
    final response = api.getOneModuleModuleModuleIdGet(moduleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->getOneModuleModuleModuleIdGet: $e\n');
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

