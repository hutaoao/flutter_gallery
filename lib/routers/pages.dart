import 'package:flutter/cupertino.dart';
import 'package:flutter_gallery/utils/storage/storage.dart';

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
    redirect: (BuildContext context, GoRouterState state) async {
      final storage = Storage();
      final token = await storage.getStorage('token');

      // 如果用户未登录，则需要登录
      final loggedIn = token != null;
      final loggingIn = state.fullPath == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      // 如果用户已登录，但仍处于登录页面，则发送到首页
      if (loggingIn) return '/';

      // 不需要重定向
      return null;
    },
    /// 路由监听
    // 有些时候,我们需要知道当前路由,跳转前的路由,或者是监听这个路由栈的变化
    // 这时候,我们就需要有一个路由的监听
    // 我们可以自己实现一个NavigatorObserver,并重写相关生命周期的方法:
    observers: [
      GoRouterObserver()
    ]
  );
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didPush: $route');
  }
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didPop: $route');
  }
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('MyTest didRemove: $route');
  }
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('MyTest didReplace: $newRoute');
  }
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    // TODO: implement didStartUserGesture
    super.didStartUserGesture(route, previousRoute);
  }
  @override
  void didStopUserGesture() {
    // TODO: implement didStopUserGesture
    super.didStopUserGesture();
  }
}

