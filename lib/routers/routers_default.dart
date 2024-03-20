import 'package:flutter/cupertino.dart';

/// layout
import '../pages/layout/layout.dart';

/// 登录注册
import '../pages/login/login.dart';
import '../pages/login/register.dart';

/// 1、配置路由 可做权限配置
final Map routes = {
  '/': (context) => const LayoutWidget(),
  '/login': (context) => const LoginWidget(),
  '/register': (context) => const RegisterWidget(),
};

/// 路由统一处理 相当于一个中间件
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;

  /// 命名路由名称
  final Function? pageContentBuilder = routes[name];
  final Route route;
  if (pageContentBuilder != null) {
    /// 判断参数是否为空
    if (settings.arguments != null) {
      route = CupertinoPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    }
    route = CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
  return null;
};
