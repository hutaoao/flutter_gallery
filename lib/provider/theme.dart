import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  late bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // 切换白天模式/黑夜模式
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
