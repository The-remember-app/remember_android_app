# api_package.api.SentenceEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTermCreateModuleIdTermIdPost1**](SentenceEntitiesApi.md#createtermcreatemoduleidtermidpost1) | **POST** /sentence/create/{module_id}/{term_id} | Create Term
[**existSentenceExistGet**](SentenceEntitiesApi.md#existsentenceexistget) | **GET** /sentence/exist | Exist Sentence
[**getAllTermAllGet**](SentenceEntitiesApi.md#getalltermallget) | **GET** /sentence/all | Get All Term
[**getAllTermFromModuleModuleIdGet**](SentenceEntitiesApi.md#getalltermfrommodulemoduleidget) | **GET** /sentence/from_module/{module_id} | Get All Term
[**getAllTermFromTermTermIdGet**](SentenceEntitiesApi.md#getalltermfromtermtermidget) | **GET** /sentence/from_term/{term_id} | Get All Term
[**getOneTermSentenceIdGet**](SentenceEntitiesApi.md#getonetermsentenceidget) | **GET** /sentence/{sentence_id} | Get One Term


# **createTermCreateModuleIdTermIdPost1**
> AnsSentenceDTOUnionBErrorNoneType createTermCreateModuleIdTermIdPost1(moduleId, termId, createSentenceDTO)

Create Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getSentenceEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 
final JsonObject termId = ; // JsonObject | 
final CreateSentenceDTO createSentenceDTO = ; // CreateSentenceDTO | 

try {
    final response = api.createTermCreateModuleIdTermIdPost1(moduleId, termId, createSentenceDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->createTermCreateModuleIdTermIdPost1: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 
 **termId** | [**JsonObject**](.md)|  | 
 **createSentenceDTO** | [**CreateSentenceDTO**](CreateSentenceDTO.md)|  | 

### Return type

[**AnsSentenceDTOUnionBErrorNoneType**](AnsSentenceDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **existSentenceExistGet**
> JsonObject existSentenceExistGet(sentenceId, termId)

Exist Sentence

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getSentenceEntitiesApi();
final JsonObject sentenceId = ; // JsonObject | 
final JsonObject termId = ; // JsonObject | 

try {
    final response = api.existSentenceExistGet(sentenceId, termId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->existSentenceExistGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sentenceId** | [**JsonObject**](.md)|  | 
 **termId** | [**JsonObject**](.md)|  | [optional] 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllTermAllGet**
> AnsListSentenceDTOUnionBErrorNoneType getAllTermAllGet(moduleIds, authorOnly, limit, offset, updatedAfter)

Get All Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getSentenceEntitiesApi();
final JsonObject moduleIds = ; // JsonObject | РЎРїРёСЃРѕРє РјРѕРґСѓР»РµР№, РёР· РєРѕС‚РѕСЂС‹С… Р±СѓРґСѓС‚ РїРѕР»СѓС‡РµРЅС‹ РїСЂРµРґР»РѕР¶РµРЅРёСЏ
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚.

try {
    final response = api.getAllTermAllGet(moduleIds, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->getAllTermAllGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleIds** | [**JsonObject**](.md)| РЎРїРёСЃРѕРє РјРѕРґСѓР»РµР№, РёР· РєРѕС‚РѕСЂС‹С… Р±СѓРґСѓС‚ РїРѕР»СѓС‡РµРЅС‹ РїСЂРµРґР»РѕР¶РµРЅРёСЏ | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚. | [optional] 

### Return type

[**AnsListSentenceDTOUnionBErrorNoneType**](AnsListSentenceDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllTermFromModuleModuleIdGet**
> AnsListSentenceDTOUnionBErrorNoneType getAllTermFromModuleModuleIdGet(moduleId, authorOnly, limit, offset, updatedAfter)

Get All Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getSentenceEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚.

try {
    final response = api.getAllTermFromModuleModuleIdGet(moduleId, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->getAllTermFromModuleModuleIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚. | [optional] 

### Return type

[**AnsListSentenceDTOUnionBErrorNoneType**](AnsListSentenceDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllTermFromTermTermIdGet**
> AnsListSentenceDTOUnionBErrorNoneType getAllTermFromTermTermIdGet(termId, authorOnly, limit, offset, updatedAfter)

Get All Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getSentenceEntitiesApi();
final JsonObject termId = ; // JsonObject | 
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚.

try {
    final response = api.getAllTermFromTermTermIdGet(termId, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->getAllTermFromTermTermIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **termId** | [**JsonObject**](.md)|  | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚. | [optional] 

### Return type

[**AnsListSentenceDTOUnionBErrorNoneType**](AnsListSentenceDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneTermSentenceIdGet**
> AnsSentenceDTOUnionBErrorNoneType getOneTermSentenceIdGet(sentenceId)

Get One Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getSentenceEntitiesApi();
final JsonObject sentenceId = ; // JsonObject | 

try {
    final response = api.getOneTermSentenceIdGet(sentenceId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SentenceEntitiesApi->getOneTermSentenceIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sentenceId** | [**JsonObject**](.md)|  | 

### Return type

[**AnsSentenceDTOUnionBErrorNoneType**](AnsSentenceDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

