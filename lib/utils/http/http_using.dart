import 'package:dio/dio.dart';
import 'http_base.dart';

/// 封装具体使用类
///
class Fetch {
  static void init({
    List<Interceptor>? interceptors,
  }) {
    HttpBase().init(
      interceptors: interceptors,
    );
  }

  static void cancelRequests({required CancelToken token}) {
    // HttpBase().cancelRequests(token: token);
  }

  static Future get(
    String path, {
    Map? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    return await HttpBase().request(
      path,
      method: "GET",
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
      refresh: refresh,
      cacheKey: cacheKey,
    );
  }

  static Future post(
    String path, {
    Map? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await HttpBase().request(
      path,
      method: "POST",
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future put(
    String path, {
    Map? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await HttpBase().request(
      path,
      method: "PUT",
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future delete(
    String path, {
    Map? data,a,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await HttpBase().request(
      path,
      method: "DELETE",
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
