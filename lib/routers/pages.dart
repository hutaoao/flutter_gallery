import 'package:flutter/material.dart';
import 'package:flutter_gallery/utils/storage/storage.dart';

import 'names.dart';
import 'package:go_router/go_router.dart';

/// layout
import '../pages/layout/layout.dart';

/// 登录注册
import '../pages/login/login.dart';
import '../pages/login/register.dart';

/// 语雀详情页
import '../pages/yuque/detail.dart';
/// 组件详情页
import '../pages/component/detail.dart';
import 'package:flutter_gallery/models/component_model.dart';

import '../pages/leave_message/leave_message.dart';
import '../pages/my/app_settings/app_setting.dart';
import '../pages/my/app_settings/dark_mode.dart';

class AppRouters {
  static final GoRouter routers = GoRouter(
    initialLocation: RouterNames.init,
    routes: <RouteBase>[
      GoRoute(
        path: RouterNames.init,
        builder: (context, state) => const LayoutWidget(),
        routes: <RouteBase>[
          GoRoute(
            path: RouterNames.yuQueDetail,
            builder: (context, state) {
              final String? slug = state.pathParameters['slug'];
              return YuQueDetailWidget(slug: slug);
            },
          ),
          GoRoute(
            path: RouterNames.widgetDetail,
            builder: (context, GoRouterState state) {
              final extraData = state.extra as ComponentModel;
              return ComponentDetail(extraData: extraData);
            },
          ),
          GoRoute(
            path: RouterNames.appSettings,
            builder: (context, GoRouterState state) => const AppSettingsWidget(),
            routes: <RouteBase>[
              GoRoute(
                path: RouterNames.darkMode,
                builder: (context, GoRouterState state) => const DarkModeWidget(),
              )
            ]
          )
        ],
      ),
      GoRoute(
        path: RouterNames.login,
        builder: (context, state) => const LoginWidget(),
      ),
      GoRoute(
        path: RouterNames.register,
        builder: (context, state) => const RegisterWidget(),
      ),
      GoRoute(
        path: RouterNames.leaveMessage,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const LeaveMessage(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              /// 平滑 - 有底部弹出
              // return SlideTransition(
              //   position: Tween<Offset>(
              //     begin: const Offset(0, 1),
              //     end: const Offset(0, 0),
              //   ).animate(animation),
              //   child: child,
              // );
              /// 缩放打开页面
              return ScaleTransition(
                scale: CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
                child: child,
              );
            },
          );
        },
      ),
    ],
    /// 路由重定向
    redirect: (BuildContext context, GoRouterState state) async => await redirection(context, state),
    /// 路由监听
    // 有些时候,我们需要知道当前路由,跳转前的路由,或者是监听这个路由栈的变化
    // 这时候,我们就需要有一个路由的监听
    // 我们可以自己实现一个NavigatorObserver,并重写相关生命周期的方法:
    observers: [
      GoRouterObserver()
    ]
  );
}

redirection(BuildContext context, GoRouterState state) async{
  final storage = Storage();
  final token = await storage.getStorage('token');
  final GoRouter router = AppRouters.routers;

  // 如果用户未登录，则需要登录
  final loggedIn = token != null;
  final loggingIn = state.fullPath == '/login' || state.fullPath == '/register';
  if (!loggedIn) return loggingIn ? null : router.go('/login');

  // 如果用户已登录，但仍处于登录页面，则发送到首页
  if (loggingIn) return '/';

  // 不需要重定向
  return null;
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
  }
  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
  }
  @override
  void didRemove(Route route, Route? previousRoute) {
    // TODO: implement didRemove
    super.didRemove(route, previousRoute);
  }
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // print('MyTest didReplace: $newRoute');
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

