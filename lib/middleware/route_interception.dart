/// 此处为Get插件的中间件 - 路由重定向（该文件未使用 仅供学习参考）
library;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 中间件 - 登录拦截
class RouterInterception extends GetMiddleware {

  /// 路由重定向
  @override
  RouteSettings? redirect(String? route) {
    const isLogin = true;
    if (!isLogin) {
      return const RouteSettings(name: '/login'); // 匹配路由之前做操作
    }
    return null;
  }
}
