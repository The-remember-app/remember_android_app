import 'dart:async';

import 'package:built_value/json_object.dart';
import 'package:dio/dio.dart';
import 'package:observable/observable.dart';

import '../../api_package/lib/api_package.dart';
import '../../src/repositoris/db_data_source/http_utils.dart';
import '../network_errors.dart';
import '../new_network_processor.dart';

class UrlsController {
  final List<HttpUtilsDbDS> _urlObjects;
  late final List<String> _startedUrls;
  final ObservableList<UnaryUrlController> _activeUrls =
      ObservableList<UnaryUrlController>();
  late List<UnaryUrlController> _processingUrls = [];

  UrlsController(this._urlObjects) {
    _processingUrls = [for (var urlObject in _urlObjects) UnaryUrlController(urlObject)];
    _startedUrls = [for (var urlObject in _urlObjects) urlObject.httpUrl];
  }

  Stream<UnaryUrlController> activeApis() async* {
    for (var i in _activeUrls) {
      yield i;
    }
    List<(UnaryUrlController, Future<Response<JsonObject>?>)>
        healthCheckFutures = [
      for (var i in _processingUrls)
        if (i.healthCheckFuture != null) (i, i.healthCheckFuture!)
    ];

    late UnaryUrlController? currUrlController;

    healthCheckFutures = [
      for (var i in healthCheckFutures)
        (
          i.$1,
          i.$2.whenComplete(() {
            currUrlController = healthCheckFutures
                .where((element) => element.$1 == i.$1)
                .firstOrNull
                ?.$1;
            healthCheckFutures = healthCheckFutures
                .where((element) => element.$1 != i.$1)
                .toList();
          })
        )
    ];

    while (healthCheckFutures.isNotEmpty) {
      Response<JsonObject>? answer =
          await Future.any([for (var i in healthCheckFutures) i.$2]);
      if (UnaryUrlController.testConnection(answer) &&
          currUrlController != null) {
        _activeUrls.add(currUrlController!);
        _processingUrls.remove(currUrlController);
        yield currUrlController!;
      }
    }
  }
}

class UnaryUrlController {
  final HttpUtilsDbDS urlObj;
  late final String url;
  late Future<Response<JsonObject>?>? healthCheckFuture;
  late Dio dio;
  late ApiPackage apiContainersContainer;
  late AuthApi authApi;
  late Future<Map<String, String>>? authFuture;


  UnaryUrlController(this.urlObj) {
    url = urlObj.httpUrl;
    dio = Dio(BaseOptions(baseUrl: urlObj.httpUrl));
    apiContainersContainer =
        ApiPackage(dio: dio, serializers: standardSerializers);
    authApi = apiContainersContainer.getAuthApi();
    healthCheckFuture =
        webProtocolDecorator(authApi.healthcheckGetHealthcheckGet());
  }

  Future<T?> webProtocolDecorator<T extends Response>(
      Future<T> networkQuery,
      {int targetStatusCode = 200}) async {
    var networkQueryNew = networkQuery.then((value) {
      if (value.statusCode == targetStatusCode) {
        return Future<T?>.value(value);
      }
      throw 'Bad';
    }).catchError((error, stackTrace) {
      return null;
    }, test: (error) {
      if (error is UserNotActiveException) {
        return false;
      } else if (error is DioException) {
        return true;
      }
      return (error is int && error >= 400);
    });
    return networkQueryNew;
  }

  static bool testConnection(Response<JsonObject>? answer) {
    return answer?.data != null && (answer!.data as bool) == true;
  }
}
