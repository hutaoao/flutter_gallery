import 'package:flutter/material.dart';
import 'package:flutter_gallery/globals/globals.dart' as globals;

class MySnackbar extends StatelessWidget {
  final String message;
  final SnackBarAction? action;

  const MySnackbar({super.key, required this.message, this.action});

  /// 显示
  void showSnackBar() {
    globals.scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
        duration: const Duration(seconds: 2), // 设置 SnackBar 显示的时间
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
