# api_package.api.ModuleEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createModuleModuleCreatePost**](ModuleEntitiesApi.md#createmodulemodulecreatepost) | **POST** /module/create | Create Module
[**deletePersonalizeModuleModulePersonalizeDeleteDelete**](ModuleEntitiesApi.md#deletepersonalizemodulemodulepersonalizedeletedelete) | **DELETE** /module/personalize/delete | Delete Personalize Module
[**getAllModuleModuleAllGet**](ModuleEntitiesApi.md#getallmodulemoduleallget) | **GET** /module/all | Get All Module
[**getOneModuleModuleModuleIdGet**](ModuleEntitiesApi.md#getonemodulemodulemoduleidget) | **GET** /module/{module_id} | Get One Module
[**updatePersonalizeModuleModulePersonalizeCreateOrUpdatePut**](ModuleEntitiesApi.md#updatepersonalizemodulemodulepersonalizecreateorupdateput) | **PUT** /module/personalize/create_or_update | Update Personalize Module


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

# **deletePersonalizeModuleModulePersonalizeDeleteDelete**
> JsonObject deletePersonalizeModuleModulePersonalizeDeleteDelete(body)

Delete Personalize Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject body = ; // JsonObject | 

try {
    final response = api.deletePersonalizeModuleModulePersonalizeDeleteDelete(body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->deletePersonalizeModuleModulePersonalizeDeleteDelete: $e\n');
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

# **updatePersonalizeModuleModulePersonalizeCreateOrUpdatePut**
> JsonObject updatePersonalizeModuleModulePersonalizeCreateOrUpdatePut(body)

Update Personalize Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getModuleEntitiesApi();
final JsonObject body = ; // JsonObject | 

try {
    final response = api.updatePersonalizeModuleModulePersonalizeCreateOrUpdatePut(body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ModuleEntitiesApi->updatePersonalizeModuleModulePersonalizeCreateOrUpdatePut: $e\n');
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

