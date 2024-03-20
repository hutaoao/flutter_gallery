import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetCacheInterceptor extends Interceptor {}

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
}

class ErrorInterceptor extends Interceptor {
  /// 是否有网
  Future isConnected() async {
    final Connectivity connectivity = Connectivity();

    /// ConnectivityResult.wifi
    /// ConnectivityResult.none
    var connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    var isConnectedNetwork = await isConnected();
    print(isConnectedNetwork);
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
    Get.snackbar('提示', message);

    return super.onError(err, handler);
  }
}
