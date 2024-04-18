import 'dart:async';

import 'package:dio/dio.dart';
import '../../routers/pages.dart';
import '../storage/storage.dart';
import 'package:go_router/go_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_gallery/routers/routers.dart';
import 'package:flutter_gallery/widgets/my_snackbar/my_snackbar.dart';

/// 实现拦截器类
class DioInterceptors extends Interceptor {
  final storage = Storage();
  final GoRouter router = AppRouters.routers;
  final whiteList = ['/apis/login', '/apis/register'];

  /// 请求拦截
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    // TODO: implement onRequest
    // 头部添加token
    final token = await storage.getStorage('token');
    if (token == null && !whiteList.contains(options.path)) {
      router.go('/login');
      return;
    }
    options.headers['Token'] = token;

    // 更多业务需求...
    // handler.next(options);
    super.onRequest(options, handler);
  }

  /// 响应拦截
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    /// 这里你可以做
    // 请求成功是对数据做基本处理
    // 对某些单独的url返回数据做特殊处理
    // 根据公司的业务需求进行定制化处理
    var responseCode = response.data['code'];
    // { msg: 'token过期，请重新登录！', code: 10008 }
    // { msg: 'token无效，请重新登录！', code: 10009 }
    if (responseCode == 10008 || responseCode == 10009) {
      MySnackbar.error(message: 'token失效，即将跳转登录');
      await storage.clear();
      Timer(const Duration(seconds: 2), () {
        router.push('/login');
      });
    }

    // handler.next(response);
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    var isConnectedNetwork = await isConnected();
    String message;
    switch (err.response?.statusCode) {
      case 400:
        message = '请求方式错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        if (!isConnectedNetwork) {
          message = '请检查网络';
          break;
        }
        message = '请求失败，错误码：${err.response?.statusCode}';
        break;
    }
    MySnackbar.error(message: message);

    super.onError(err, handler);
  }

  /// 是否有网
  Future isConnected() async {
    final Connectivity connectivity = Connectivity();

    /// ⚠️这里有一个坑：开了代理情况下返回结果会紊乱
    /// ConnectivityResult.wifi/ConnectivityResult.mobile/ConnectivityResult.none ...
    var connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
