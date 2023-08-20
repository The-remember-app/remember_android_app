# api_package.api.TermEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTermTermCreatePost**](TermEntitiesApi.md#createtermtermcreatepost) | **POST** /term/create | Create Term
[**getAllAddTermInfoTermaddInfoAllGet**](TermEntitiesApi.md#getalladdterminfotermaddinfoallget) | **GET** /termadd_info/all | Get All Add Term Info
[**getAllTermTermAllGet**](TermEntitiesApi.md#getalltermtermallget) | **GET** /term/all | Get All Term
[**getAllTermTermFromModuleModuleIdGet**](TermEntitiesApi.md#getalltermtermfrommodulemoduleidget) | **GET** /term/from_module/{module_id} | Get All Term
[**getOneTermTermTermIdGet**](TermEntitiesApi.md#getonetermtermtermidget) | **GET** /term/{term_id} | Get One Term


# **createTermTermCreatePost**
> TermDTO createTermTermCreatePost(createTermDTO)

Create Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final CreateTermDTO createTermDTO = ; // CreateTermDTO | 

try {
    final response = api.createTermTermCreatePost(createTermDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->createTermTermCreatePost: $e\n');
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

# **getAllAddTermInfoTermaddInfoAllGet**
> JsonObject getAllAddTermInfoTermaddInfoAllGet()

Get All Add Term Info

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();

try {
    final response = api.getAllAddTermInfoTermaddInfoAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getAllAddTermInfoTermaddInfoAllGet: $e\n');
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

final api = ApiPackage().getTermEntitiesApi();

try {
    final response = api.getAllTermTermAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getAllTermTermAllGet: $e\n');
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

# **getAllTermTermFromModuleModuleIdGet**
> JsonObject getAllTermTermFromModuleModuleIdGet(moduleId)

Get All Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 

try {
    final response = api.getAllTermTermFromModuleModuleIdGet(moduleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getAllTermTermFromModuleModuleIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

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

final api = ApiPackage().getTermEntitiesApi();
final JsonObject termId = ; // JsonObject | 

try {
    final response = api.getOneTermTermTermIdGet(termId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getOneTermTermTermIdGet: $e\n');
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

