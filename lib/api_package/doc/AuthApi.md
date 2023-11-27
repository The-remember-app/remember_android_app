# api_package.api.AuthApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**healthcheckGetHealthcheckGet**](AuthApi.md#healthcheckgethealthcheckget) | **GET** /auth/healthcheck | Healthcheck Get
[**healthcheckPostHealthcheckPost**](AuthApi.md#healthcheckposthealthcheckpost) | **POST** /auth/healthcheck | Healthcheck Post
[**loginForAccessTokenInOtherStyleTokenOtherStylePost**](AuthApi.md#loginforaccesstokeninotherstyletokenotherstylepost) | **POST** /auth/token/other_style | Login For Access Token In Other Style
[**loginForAccessTokenTokenPost**](AuthApi.md#loginforaccesstokentokenpost) | **POST** /auth/token | Login For Access Token


# **healthcheckGetHealthcheckGet**
> JsonObject healthcheckGetHealthcheckGet()

Healthcheck Get

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getAuthApi();

try {
    final response = api.healthcheckGetHealthcheckGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->healthcheckGetHealthcheckGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **healthcheckPostHealthcheckPost**
> JsonObject healthcheckPostHealthcheckPost()

Healthcheck Post

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getAuthApi();

try {
    final response = api.healthcheckPostHealthcheckPost();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->healthcheckPostHealthcheckPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginForAccessTokenInOtherStyleTokenOtherStylePost**
> AnsTokenBError loginForAccessTokenInOtherStyleTokenOtherStylePost(username, password, grantType, scope, clientId, clientSecret)

Login For Access Token In Other Style

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getAuthApi();
final JsonObject username = ; // JsonObject | 
final JsonObject password = ; // JsonObject | 
final JsonObject grantType = ; // JsonObject | 
final JsonObject scope = ; // JsonObject | 
final JsonObject clientId = ; // JsonObject | 
final JsonObject clientSecret = ; // JsonObject | 

try {
    final response = api.loginForAccessTokenInOtherStyleTokenOtherStylePost(username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->loginForAccessTokenInOtherStyleTokenOtherStylePost: $e\n');
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

[**AnsTokenBError**](AnsTokenBError.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginForAccessTokenTokenPost**
> Token loginForAccessTokenTokenPost(username, password, grantType, scope, clientId, clientSecret)

Login For Access Token

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getAuthApi();
final JsonObject username = ; // JsonObject | 
final JsonObject password = ; // JsonObject | 
final JsonObject grantType = ; // JsonObject | 
final JsonObject scope = ; // JsonObject | 
final JsonObject clientId = ; // JsonObject | 
final JsonObject clientSecret = ; // JsonObject | 

try {
    final response = api.loginForAccessTokenTokenPost(username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->loginForAccessTokenTokenPost: $e\n');
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

