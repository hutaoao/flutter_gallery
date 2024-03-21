import 'package:dio/dio.dart';
import 'http_interceptor.dart';
import '../storage/storage.dart';
import 'http_config.dart';

class HttpBase {
  final storage = Storage();
  static final HttpBase _instance = HttpBase._internal();

  // 单例模式使用Request类，
  factory HttpBase() => _instance;

  // 使用late 使声明dio未实例化通过空安全检测
  static late final Dio dio;

  HttpBase._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions();

    dio = Dio(options);

    /// 添加request拦截器
    dio.interceptors.add(RequestInterceptor());

    /// 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());

    /// 添加cache拦截器
    dio.interceptors.add(NetCacheInterceptor());

    /// 添加retry拦截器
    // dio.interceptors.add(
    //   RetryOnConnectionChangeInterceptor(
    //     requestRetrier: DioConnectivityRequestRetrier(
    //       dio: dio,
    //       connectivity: Connectivity(),
    //     ),
    //   ),
    // );

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    // if (PROXY_ENABLE) {
    //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (client) {
    //     client.findProxy = (uri) {
    //       return "PROXY $PROXY_IP:$PROXY_PORT";
    //     };
    //     //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //   };
    // }
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init({
    String? baseUrl = HttpConfig.baseURL,
    Duration? connectTimeout = const Duration(milliseconds: HttpConfig.timeout),
    Duration? receiveTimeout = const Duration(milliseconds: HttpConfig.timeout),
    Map<String, String>? headers,
    List<Interceptor>? interceptors,
  }) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers ?? const {},
    );
    // 在初始化http类的时候，可以传入拦截器
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// 添加认证
  /// 读取本地配置
  Map<String, dynamic>? _getAuthorizationHeader() {
    Map<String, dynamic>? headers;
    // 获取本地token
    storage.getStorage('token').then((value) {
      headers = {
        "your token name": value,
      };
    });
    return headers;
  }

  Future request(
    String path, {
    required String method,
    Map? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    // bool noCache = !CACHE_ENABLE,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(
      method: method,
      extra: {
        "refresh": refresh,
        // "noCache": noCache,
        "cacheKey": cacheKey,
        "cacheDisk": cacheDisk,
      },
    );
    Map<String, dynamic>? authorization = _getAuthorizationHeader();
    if (authorization != null) {
      requestOptions = requestOptions.copyWith(headers: authorization);
    }
    Response response;
    response = await dio.request(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
      // cancelToken: cancelToken ?? _cancelToken,
    );

    return response.data;
  }
}
