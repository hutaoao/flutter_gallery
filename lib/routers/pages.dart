import 'package:get/get.dart';
import '../middleware/route_interception.dart';
import 'names.dart';

/// layout
import '../pages/layout/layout.dart';

/// 登录注册
import '../pages/login/login.dart';
import '../pages/login/register.dart';

class AppRouters {
  static final routers = [
    GetPage(
      name: RouterNames.init,
      page: () => const LayoutWidget(),
      middlewares: [RouterInterception()]
    ),
    GetPage(name: RouterNames.login, page: () => const LoginWidget()),
    GetPage(name: RouterNames.register, page: () => const RegisterWidget()),
  ];
}
