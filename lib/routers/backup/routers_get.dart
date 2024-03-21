/// Get的路由配置
library;

import 'package:get/get.dart';
import '../../middleware/route_interception.dart';

/// layout
import '../../pages/layout/layout.dart';

/// 登录注册
import '../../pages/login/login.dart';
import '../../pages/login/register.dart';

class AppRouter {
  static final routers = [
    GetPage(name: '/', page: () => const LayoutWidget(), middlewares: [RouterInterception()]),
    GetPage(name: '/login', page: () => const LoginWidget()),
    GetPage(name: '/register', page: () => const RegisterWidget()),
  ];
}
