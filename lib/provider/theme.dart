import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  late String _darkMode = 'white';
  late String _darkModeStr = 'white'; // 控制模式选择页面的三个切换按钮 - 空代表跟随系统

  bool get isDarkMode => _darkMode == 'black';
  String get darkModeStr => _darkModeStr;

  // 切换白天模式/黑夜模式
  void toggleTheme(String theme) {
    _darkMode = theme;
    notifyListeners();
  }

  // 控制跟随系统还是深/浅模式
  void changeThemeStr(String themeStr) {
    _darkModeStr = themeStr;
    notifyListeners();
  }
}
