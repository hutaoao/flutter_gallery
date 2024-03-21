import 'package:flutter/cupertino.dart';

import 'names.dart';
import 'package:go_router/go_router.dart';

/// layout
import '../pages/layout/layout.dart';

/// 登录注册
import '../pages/login/login.dart';
import '../pages/login/register.dart';

class AppRouters {
  static final GoRouter routers = GoRouter(
    initialLocation: RouterNames.init,
    routes: <RouteBase>[
      GoRoute(
        path: RouterNames.init,
        builder: (context, state) => const LayoutWidget(),
      ),
      GoRoute(
        path: RouterNames.login,
        builder: (context, state) => const LoginWidget(),
      ),
      GoRoute(
        path: RouterNames.register,
        builder: (context, state) => const RegisterWidget(),
      ),
    ],
    /// 路由重定向
    redirect: (BuildContext context, GoRouterState state) {
      // 如果用户未登录，则需要登录
      const loggedIn = true;
      final loggingIn = state.fullPath == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      // 如果用户已登录，但仍处于登录页面，则发送到首页
      if (loggingIn) return '/';

      // 不需要重定向
      return null;
    },
  );
}
