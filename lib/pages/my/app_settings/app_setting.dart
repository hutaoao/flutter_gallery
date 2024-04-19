import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gallery/provider/theme.dart';

/// 关于我
class AppSettingsWidget extends StatefulWidget {
  const AppSettingsWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AppSettingsWidgetState();
}

enum Theme {black, white}
extension ThemeExtension on Theme {
  String get name => ['深色模式', '浅色模式'][index];
}

class _AppSettingsWidgetState extends State<AppSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    /// 监听
    final theme = context.watch<ThemeViewModel>().isDarkMode ? Theme.black : Theme.white;

    return Scaffold(
      backgroundColor: const Color(0xf8f8f8f8),
      appBar: AppBar(
        title: const Text('应用设置'),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 15),
            ListTile(
              title: const Text('深色模式'),
              subtitle: Text(theme.name),
              leading: const Icon(Icons.color_lens, color: Colors.red),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
              tileColor: Colors.white,
              onTap: () => context.push('/app-settings/dark-mode'),
            ),
            const Divider(height: 1, color: Color(0xf8f8f8f8)),
            const ListTile(
              title: Text('主题色设置'),
              subtitle: Text('烈焰红'),
              leading: Icon(Icons.colorize, color: Colors.red),
              trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
              tileColor: Colors.white,
            ),
            const SizedBox(height: 15),
            const ListTile(
              title: Text('字体设置'),
              subtitle: Text('xxxxx'),
              leading: Icon(Icons.font_download, color: Colors.red),
              trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
              tileColor: Colors.white,
            ),
          ],
        ),
      )
    );
  }
}
