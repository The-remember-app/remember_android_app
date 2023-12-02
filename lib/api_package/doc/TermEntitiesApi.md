# api_package.api.TermEntitiesApi

## Load the API package
```dart
import 'package:api_package/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPersonalizeTermPersonalizeCreatePost**](TermEntitiesApi.md#createpersonalizetermpersonalizecreatepost) | **POST** /term/personalize/create | SYSTEM ONLY
[**createTermCreatePost**](TermEntitiesApi.md#createtermcreatepost) | **POST** /term/create | Create Term
[**existPersonalizeTermPersonalizeExistGet**](TermEntitiesApi.md#existpersonalizetermpersonalizeexistget) | **GET** /term/personalize/exist | Exist Personalize Term
[**existTermExistGet**](TermEntitiesApi.md#existtermexistget) | **GET** /term/exist | Exist Term
[**getAllPersonalizeTermFromModulePersonalizeFromModuleModuleIdGet**](TermEntitiesApi.md#getallpersonalizetermfrommodulepersonalizefrommodulemoduleidget) | **GET** /term/personalize/from_module/{module_id} | Get All Personalize Term From Module
[**getAllPersonalizeTermFromModulePersonalizeTermIdGet**](TermEntitiesApi.md#getallpersonalizetermfrommodulepersonalizetermidget) | **GET** /term/personalize/{term_id} | Get All Personalize Term From Module
[**getAllPersonalizeTermPersonalizeAllGet**](TermEntitiesApi.md#getallpersonalizetermpersonalizeallget) | **GET** /term/personalize/all | Get All Personalize Term
[**getOneTermTermIdGet**](TermEntitiesApi.md#getonetermtermidget) | **GET** /term/{term_id} | Get One Term
[**getTermIdsFromModuleFromModuleModuleIdIdsOnlyGet**](TermEntitiesApi.md#gettermidsfrommodulefrommodulemoduleididsonlyget) | **GET** /term/from_module/{module_id}/ids_only | Get Term Ids From Module
[**getTermsFromModuleFromModuleModuleIdGet**](TermEntitiesApi.md#gettermsfrommodulefrommodulemoduleidget) | **GET** /term/from_module/{module_id} | Get Terms From Module
[**getTermsFromModuleListAllGet**](TermEntitiesApi.md#gettermsfrommodulelistallget) | **GET** /term/all | Get Terms From Module List
[**updatePersonalizeTermPersonalizeUpdateTermIdPut**](TermEntitiesApi.md#updatepersonalizetermpersonalizeupdatetermidput) | **PUT** /term/personalize/update/{term_id} | Update Personalize Term


# **createPersonalizeTermPersonalizeCreatePost**
> AnsOnlyPersonalizePartTermDTOUnionBErrorNoneType createPersonalizeTermPersonalizeCreatePost(createOnlyPersonalizePartTermDTO, fromModuleMicroservice)

SYSTEM ONLY

СЌС‚РѕС‚ СЂРѕСѓС‚ Р±СѓРґРµС‚ СѓРґР°Р»С‘РЅ СЃ РІРЅРµРґСЂРµРЅРёРµРј РЎР°РіРё

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final CreateOnlyPersonalizePartTermDTO createOnlyPersonalizePartTermDTO = ; // CreateOnlyPersonalizePartTermDTO | 
final JsonObject fromModuleMicroservice = ; // JsonObject | РљРѕСЃС‚С‹Р»СЊ, РїСЂРё РїРµСЂРµРїРёСЃС‹РІР°РЅРёРё РІР·Р°РёРјРѕРґРµР№СЃС‚РІРёСЏ СЃ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµРј РЎР°РіРё Р±СѓРґРµС‚ СѓРґР°Р»С‘РЅ

try {
    final response = api.createPersonalizeTermPersonalizeCreatePost(createOnlyPersonalizePartTermDTO, fromModuleMicroservice);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->createPersonalizeTermPersonalizeCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOnlyPersonalizePartTermDTO** | [**CreateOnlyPersonalizePartTermDTO**](CreateOnlyPersonalizePartTermDTO.md)|  | 
 **fromModuleMicroservice** | [**JsonObject**](.md)| РљРѕСЃС‚С‹Р»СЊ, РїСЂРё РїРµСЂРµРїРёСЃС‹РІР°РЅРёРё РІР·Р°РёРјРѕРґРµР№СЃС‚РІРёСЏ СЃ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµРј РЎР°РіРё Р±СѓРґРµС‚ СѓРґР°Р»С‘РЅ | [optional] 

### Return type

[**AnsOnlyPersonalizePartTermDTOUnionBErrorNoneType**](AnsOnlyPersonalizePartTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createTermCreatePost**
> AnsTermDTOUnionBErrorNoneType createTermCreatePost(createTermDTO)

Create Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final CreateTermDTO createTermDTO = ; // CreateTermDTO | 

try {
    final response = api.createTermCreatePost(createTermDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->createTermCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createTermDTO** | [**CreateTermDTO**](CreateTermDTO.md)|  | 

### Return type

[**AnsTermDTOUnionBErrorNoneType**](AnsTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **existPersonalizeTermPersonalizeExistGet**
> JsonObject existPersonalizeTermPersonalizeExistGet(termId, moduleId)

Exist Personalize Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject termId = ; // JsonObject | 
final JsonObject moduleId = ; // JsonObject | 

try {
    final response = api.existPersonalizeTermPersonalizeExistGet(termId, moduleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->existPersonalizeTermPersonalizeExistGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **termId** | [**JsonObject**](.md)|  | 
 **moduleId** | [**JsonObject**](.md)|  | [optional] 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **existTermExistGet**
> JsonObject existTermExistGet(termId, moduleId, authorId)

Exist Term

### Example
```dart
import 'package:api_package/api.dart';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject termId = ; // JsonObject | 
final JsonObject moduleId = ; // JsonObject | 
final JsonObject authorId = ; // JsonObject | 

try {
    final response = api.existTermExistGet(termId, moduleId, authorId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->existTermExistGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **termId** | [**JsonObject**](.md)|  | 
 **moduleId** | [**JsonObject**](.md)|  | [optional] 
 **authorId** | [**JsonObject**](.md)|  | [optional] 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllPersonalizeTermFromModulePersonalizeFromModuleModuleIdGet**
> AnsListPersonalizeTermDTOUnionBErrorNoneType getAllPersonalizeTermFromModulePersonalizeFromModuleModuleIdGet(moduleId, authorOnly, limit, offset, updatedAfter)

Get All Personalize Term From Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚.

try {
    final response = api.getAllPersonalizeTermFromModulePersonalizeFromModuleModuleIdGet(moduleId, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getAllPersonalizeTermFromModulePersonalizeFromModuleModuleIdGet: $e\n');
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

[**AnsListPersonalizeTermDTOUnionBErrorNoneType**](AnsListPersonalizeTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllPersonalizeTermFromModulePersonalizeTermIdGet**
> AnsPersonalizeTermDTOUnionBErrorNoneType getAllPersonalizeTermFromModulePersonalizeTermIdGet(termId, authorOnly)

Get All Personalize Term From Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject termId = ; // JsonObject | 
final JsonObject authorOnly = ; // JsonObject | 

try {
    final response = api.getAllPersonalizeTermFromModulePersonalizeTermIdGet(termId, authorOnly);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getAllPersonalizeTermFromModulePersonalizeTermIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **termId** | [**JsonObject**](.md)|  | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]

### Return type

[**AnsPersonalizeTermDTOUnionBErrorNoneType**](AnsPersonalizeTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllPersonalizeTermPersonalizeAllGet**
> AnsListPersonalizeTermDTOUnionBErrorNoneType getAllPersonalizeTermPersonalizeAllGet(moduleIds, authorOnly, limit, offset, updatedAfter)

Get All Personalize Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject moduleIds = ; // JsonObject | РЎРїРёСЃРѕРє РјРѕРґСѓР»РµР№, РёР· РєРѕС‚РѕСЂС‹С… Р±СѓРґСѓС‚ РїРѕР»СѓС‡РµРЅС‹ С‚РµСЂРјРёРЅС‹
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚.

try {
    final response = api.getAllPersonalizeTermPersonalizeAllGet(moduleIds, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getAllPersonalizeTermPersonalizeAllGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleIds** | [**JsonObject**](.md)| РЎРїРёСЃРѕРє РјРѕРґСѓР»РµР№, РёР· РєРѕС‚РѕСЂС‹С… Р±СѓРґСѓС‚ РїРѕР»СѓС‡РµРЅС‹ С‚РµСЂРјРёРЅС‹ | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚. | [optional] 

### Return type

[**AnsListPersonalizeTermDTOUnionBErrorNoneType**](AnsListPersonalizeTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOneTermTermIdGet**
> AnsPersonalizeTermDTOUnionBErrorNoneType getOneTermTermIdGet(termId)

Get One Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject termId = ; // JsonObject | 

try {
    final response = api.getOneTermTermIdGet(termId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getOneTermTermIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **termId** | [**JsonObject**](.md)|  | 

### Return type

[**AnsPersonalizeTermDTOUnionBErrorNoneType**](AnsPersonalizeTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTermIdsFromModuleFromModuleModuleIdIdsOnlyGet**
> AnsListUUIDUnionBErrorNoneType getTermIdsFromModuleFromModuleModuleIdIdsOnlyGet(moduleId)

Get Term Ids From Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 

try {
    final response = api.getTermIdsFromModuleFromModuleModuleIdIdsOnlyGet(moduleId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getTermIdsFromModuleFromModuleModuleIdIdsOnlyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleId** | [**JsonObject**](.md)|  | 

### Return type

[**AnsListUUIDUnionBErrorNoneType**](AnsListUUIDUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTermsFromModuleFromModuleModuleIdGet**
> AnsListTermDTOUnionBErrorNoneType getTermsFromModuleFromModuleModuleIdGet(moduleId, authorOnly, limit, offset, updatedAfter)

Get Terms From Module

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject moduleId = ; // JsonObject | 
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚.

try {
    final response = api.getTermsFromModuleFromModuleModuleIdGet(moduleId, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getTermsFromModuleFromModuleModuleIdGet: $e\n');
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

[**AnsListTermDTOUnionBErrorNoneType**](AnsListTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTermsFromModuleListAllGet**
> AnsListTermDTOUnionBErrorNoneType getTermsFromModuleListAllGet(moduleIds, authorOnly, limit, offset, updatedAfter)

Get Terms From Module List

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject moduleIds = ; // JsonObject | РЎРїРёСЃРѕРє РјРѕРґСѓР»РµР№, РёР· РєРѕС‚РѕСЂС‹С… Р±СѓРґСѓС‚ РїРѕР»СѓС‡РµРЅС‹ С‚РµСЂРјРёРЅС‹
final JsonObject authorOnly = ; // JsonObject | 
final JsonObject limit = ; // JsonObject | 
final JsonObject offset = ; // JsonObject | 
final JsonObject updatedAfter = ; // JsonObject | Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚.

try {
    final response = api.getTermsFromModuleListAllGet(moduleIds, authorOnly, limit, offset, updatedAfter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->getTermsFromModuleListAllGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moduleIds** | [**JsonObject**](.md)| РЎРїРёСЃРѕРє РјРѕРґСѓР»РµР№, РёР· РєРѕС‚РѕСЂС‹С… Р±СѓРґСѓС‚ РїРѕР»СѓС‡РµРЅС‹ С‚РµСЂРјРёРЅС‹ | 
 **authorOnly** | [**JsonObject**](.md)|  | [optional] [default to false]
 **limit** | [**JsonObject**](.md)|  | [optional] [default to 100]
 **offset** | [**JsonObject**](.md)|  | [optional] [default to 0]
 **updatedAfter** | [**JsonObject**](.md)| Р‘СѓРґСѓС‚ РІРѕР·РІСЂР°С‰РµРЅС‹ Р»РёС€СЊ С‚Рµ СЃСѓС‰РЅРѕСЃС‚Рё, РѕР±РЅРѕРІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… Р±С‹Р»Рѕ РїСЂРѕРёР·РІРµРґРµРЅРѕ РїРѕР·Р¶Рµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІСЂРµРјРµРЅРё. Р•СЃР»Рё РїР°СЂР°РјРµС‚СЂ РЅРµ СѓРєР°Р·Р°РЅ, С‚Рѕ С„РёР»СЊС‚СЂР°С†РёСЏ РїРѕ РІСЂРµРјРµРЅРё РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚. | [optional] 

### Return type

[**AnsListTermDTOUnionBErrorNoneType**](AnsListTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePersonalizeTermPersonalizeUpdateTermIdPut**
> AnsOnlyPersonalizePartTermDTOUnionBErrorNoneType updatePersonalizeTermPersonalizeUpdateTermIdPut(termId, updateOnlyPersonalizePartTermDTO)

Update Personalize Term

### Example
```dart
import 'package:api_package/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ApiPackage().getTermEntitiesApi();
final JsonObject termId = ; // JsonObject | 
final UpdateOnlyPersonalizePartTermDTO updateOnlyPersonalizePartTermDTO = ; // UpdateOnlyPersonalizePartTermDTO | 

try {
    final response = api.updatePersonalizeTermPersonalizeUpdateTermIdPut(termId, updateOnlyPersonalizePartTermDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TermEntitiesApi->updatePersonalizeTermPersonalizeUpdateTermIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **termId** | [**JsonObject**](.md)|  | 
 **updateOnlyPersonalizePartTermDTO** | [**UpdateOnlyPersonalizePartTermDTO**](UpdateOnlyPersonalizePartTermDTO.md)|  | 

### Return type

[**AnsOnlyPersonalizePartTermDTOUnionBErrorNoneType**](AnsOnlyPersonalizePartTermDTOUnionBErrorNoneType.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

