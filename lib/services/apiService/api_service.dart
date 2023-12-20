import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:photo_gallery/model/errorModel/error_model.dart';
import 'package:photo_gallery/services/apis.dart';

mixin ApiService {
  final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 1),
    );

  static String baseUrl = "https://picsum.photos";

  @protected
  abstract Apis apis;

  @protected
  ErrorModel onError(Object e) {
    late ErrorModel errorModel;
    if (e is DioException) {
      //TODO: Make change
      if (e.response != null) {
        log(e.response.toString());
        var message = "";
        log(e.response!.statusCode.toString());
        Map<String, dynamic> response = e.response!.data;
        var value = response[response.keys.first];
        if (value is Iterable) {
          message = value.elementAt(0).toString();
        } else {
          message = value.toString();
        }

        errorModel = ErrorModel(
          statusCode: e.response?.statusCode ?? 0,
          message: message,
        );
      } else {
        errorModel = ErrorModel(
          message:
              kDebugMode ? e.toString() : e.message ?? "Something went wrong!",
          statusCode: -1,
        );
      }

      return errorModel;
    }
    errorModel = ErrorModel(
      statusCode: -2,
      message: e.toString(),
    );
    return errorModel;
  }

  @protected
  Future<Response> onApiCall({
    required String urlPath,
    dynamic data,
    CancelToken? cancelToken,
  });
}

///
/// Class for `POST` request
/// Type of `data` should be `Map<String,dynamic>` or `FormData`
///
class Post<T> with ApiService {
  @override
  @protected
  Apis apis = Apis();

  @protected
  @override
  Future<Response> onApiCall({
    required String urlPath,
    dynamic data,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post(urlPath, data: data, cancelToken: cancelToken);
    } on DioException {
      rethrow;
    }
  }
}

///
/// Class for `GET` request
///
/// This class provide a function `onApiCall` which returns `Response<dynamic>`
///
class Get with ApiService {
  @protected
  @override
  Apis apis = Apis();

  @protected
  @override
  Future<Response> onApiCall({
    required String urlPath,
    dynamic data,
    bool removeBaseUrl = false,
    CancelToken? cancelToken,
  }) async {
    try {
      if (removeBaseUrl) {
        _dio.options.baseUrl = "";
      }
      return await _dio.get(urlPath, data: data, cancelToken: cancelToken);
    } on DioException {
      rethrow;
    }
  }
}

///
/// Class for `PATCH` request
///
/// This class provide a function `onApiCall` which returns `Response<dynamic>`
///
class Patch with ApiService {
  @protected
  @override
  Apis apis = Apis();

  @protected
  @override
  Future<Response> onApiCall({
    required String urlPath,
    dynamic data,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.patch(urlPath, data: data, cancelToken: cancelToken);
    } on DioException {
      rethrow;
    }
  }
}

///
/// Class for `DELETE` request
///
/// This class provide a function `onApiCall` which returns `Response<dynamic>`
///
class Delete with ApiService {
  @protected
  @override
  Apis apis = Apis();

  @protected
  @override
  Future<Response> onApiCall({
    required String urlPath,
    dynamic data,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete(urlPath, data: data, cancelToken: cancelToken);
    } on DioException {
      rethrow;
    }
  }
}
