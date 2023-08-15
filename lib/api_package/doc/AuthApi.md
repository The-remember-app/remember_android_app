# api_package.api.AuthApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**loginForAccessTokenAuthTokenPost**](AuthApi.md#loginforaccesstokenauthtokenpost) | **POST** /auth/token | Login For Access Token


# **loginForAccessTokenAuthTokenPost**
> Token loginForAccessTokenAuthTokenPost(username, password, grantType, scope, clientId, clientSecret)

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
    final response = api.loginForAccessTokenAuthTokenPost(username, password, grantType, scope, clientId, clientSecret);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->loginForAccessTokenAuthTokenPost: $e\n');
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

