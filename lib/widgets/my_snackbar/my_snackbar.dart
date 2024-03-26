import 'package:flutter/material.dart';
import 'package:flutter_gallery/globals/globals.dart' as globals;

class MySnackbar extends StatelessWidget {
  const MySnackbar({super.key});

  /// 显示
  static void success({required String message, SnackBarAction? action}) {
    globals.scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
        duration: const Duration(seconds: 2), // 设置 SnackBar 显示的时间
        backgroundColor: Colors.green,
      ),
    );
  }

  static void info({required String message, SnackBarAction? action}) {
    globals.scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
        duration: const Duration(seconds: 2), // 设置 SnackBar 显示的时间
        backgroundColor: Colors.grey,
      ),
    );
  }

  static void error({required String message, SnackBarAction? action}) {
    globals.scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
        duration: const Duration(seconds: 2), // 设置 SnackBar 显示的时间
        backgroundColor: Colors.red,
      ),
    );
  }

  /// 隐藏
  void hideSnackBar() {
    globals.scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
