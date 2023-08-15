# api_package.api.SentenceEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTermSentenceCreatePost**](SentenceEntitiesApi.md#createtermsentencecreatepost) | **POST** /sentence/create | Create Term
[**getAllTermSentenceAllGet**](SentenceEntitiesApi.md#getalltermsentenceallget) | **GET** /sentence/all | Get All Term
[**getOneTermSentenceSentenceIdGet**](SentenceEntitiesApi.md#getonetermsentencesentenceidget) | **GET** /sentence/{sentence_id} | Get One Term


# **createTermSentenceCreatePost**
> SentenceDTO createTermSentenceCreatePost(createSentenceDTO)

Create Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getSentenceEntitiesApi();
final CreateSentenceDTO createSentenceDTO = ; // CreateSentenceDTO | 

try {
    final response = api.createTermSentenceCreatePost(createSentenceDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->createTermSentenceCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createSentenceDTO** | [**CreateSentenceDTO**](CreateSentenceDTO.md)|  | 

### Return type

[**SentenceDTO**](SentenceDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllTermSentenceAllGet**
> JsonObject getAllTermSentenceAllGet()

Get All Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getSentenceEntitiesApi();

try {
    final response = api.getAllTermSentenceAllGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->getAllTermSentenceAllGet: $e\n');
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

# **getOneTermSentenceSentenceIdGet**
> SentenceDTO getOneTermSentenceSentenceIdGet(sentenceId)

Get One Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getSentenceEntitiesApi();
final JsonObject sentenceId = ; // JsonObject | 

try {
    final response = api.getOneTermSentenceSentenceIdGet(sentenceId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->getOneTermSentenceSentenceIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sentenceId** | [**JsonObject**](.md)|  | 

### Return type

[**SentenceDTO**](SentenceDTO.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

