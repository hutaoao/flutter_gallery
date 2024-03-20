import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/storage/storage.dart';

/// 中间件 - 登录拦截
class RouterInterception extends GetMiddleware {
  final storage = Storage();

  /// 路由重定向
  @override
  RouteSettings? redirect(String? route) {
    // print(result);
    // // if (_auth()) {
    // //   return null;
    // // } else {
    //   return const RouteSettings(name: '/login'); // 匹配路由之前做操作
    // // }


    storage.getStorage('name').then((value) => null);
    return null;
    // return null;
  }
}
