import 'package:dio/dio.dart';
import 'http_interceptor.dart';
import '../storage/storage.dart';
import 'http_config.dart';

class HttpBase {
  static final storage = Storage();
  static final HttpBase _instance = HttpBase._internal(); // 通用全局单例，第一次使用时初始化。

  // 单例模式使用Request类，
  factory HttpBase() => _instance;

  // 使用late 使声明dio未实例化通过空安全检测
  static late final Dio dio;

  HttpBase._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions();

    dio = Dio(options);

    /// 添加拦截器 onRequest/onResponse/onError 等
    dio.interceptors.add(DioInterceptors());

    /// 这里还可以添加 添加转换器/添加cookie管理器/刷新token拦截器(lock/unlock)

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

  /// 取消请求token
  final CancelToken _cancelToken = CancelToken();

  /// 请求类
  Future request(String path, {
    String method = 'get',
    Map? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool? refresh = false, // 当请求返回401或403状态码（表示未授权或无权限访问资源）时，刷新token并重新发起请求的一种机制
    bool? noCache = false, // 禁止某些请求被缓存 - noCache设置为true时，这个请求将不会被缓存
    String? cacheKey, // 指定缓存策略的键（key）- 通过cacheKey来标识这个请求结果
    bool? cacheDisk = false, // 使用磁盘缓存，将网络请求的响应数据持久化到设备的磁盘上 - 通常与CacheInterceptor一起使用
    ProgressCallback? onSendProgress, // 跟踪上传进度
    ProgressCallback? onReceiveProgress, // 跟踪下载进度
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(
      method: method,
      extra: {
        "refresh": refresh,
        "noCache": noCache,
        "cacheKey": cacheKey,
        "cacheDisk": cacheDisk,
      },
    );

    Response response;
    response = await dio.request(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress
    );

    return response.data;
  }
}
