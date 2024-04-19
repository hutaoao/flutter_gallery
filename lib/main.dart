import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gallery/globals/globals.dart' as globals;

import 'utils/http/http_using.dart';
import 'provider/theme.dart';
import 'provider/test.dart';
import 'provider/yuque.dart';

/// 自带路由配置
// import './routers/routers_default.dart';

/// Get路由配置
// import './binding/binding.dart';

import './routers/routers.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    /// http初始化
    Fetch.init();
  }

  @override
  Widget build(BuildContext context) {
    /// 屏幕适配 flutter_screenutil
    // 填入设计稿中设备的屏幕尺寸,单位dpß
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TextViewModel>(create: (_) => TextViewModel()),
        ChangeNotifierProvider<ThemeViewModel>(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider<YuQueViewModel>(create: (_) => YuQueViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          /// 使用 Get 时：GetMaterialApp 替换为 MaterialApp
          return MaterialApp.router(
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                /// 统一appBar标题-居中 - android/ios表现形式不一样
                centerTitle: true,

                /// 统一appBar标题-颜色
                // foregroundColor: Colors.black,

                /// 统一appBar标题-背景色
                // backgroundColor: Colors.black12,
              ),
              // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            themeMode: Provider.of<ThemeViewModel>(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
            /// 隐藏右上角的debug标签
            debugShowCheckedModeBanner: false,

            /// 自带路由配置
            // onGenerateRoute: onGenerateRoute,
            // 初始化路由
            // initialRoute: RouterNames.login,

            /// Getx配置 路由/状态管理
            // 路由配置
            // getPages: AppRouters.routers,
            // 状态管理 - 全局绑定
            // initialBinding: AllControllerBinding(),

            /// go_router 配置
            routerConfig: AppRouters.routers,

            scaffoldMessengerKey: globals.scaffoldMessengerKey,
          );
        },
      ),
    );
  }
}
