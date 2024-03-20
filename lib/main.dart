import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'utils/http/http_using.dart';

/// 自带路由配置
// import './routers/routers_default.dart';

/// Get路由配置
import './routers/routers.dart';
import './binding/binding.dart';

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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        /// GetMaterialApp 替换为 MaterialApp
        return GetMaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              centerTitle: true,

              /// 统一appBar标题-居中 - android/ios表现形式不一样
              foregroundColor: Colors.black,

              /// 统一appBar标题-颜色
              backgroundColor: Colors.black12,

              /// 统一appBar标题-背景色
            ),
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),

          /// 隐藏右上角的debug标签
          debugShowCheckedModeBanner: false,

          /// 初始化路由
          initialRoute: RouterNames.login,

          /// 自带路由配置
          // onGenerateRoute: onGenerateRoute,
          /// Getx配置 路由/状态管理
          getPages: AppRouters.routers,

          /// 路由配置
          initialBinding: AllControllerBinding(),

          /// 状态管理 - 全局绑定
        );
      },
    );
  }
}
