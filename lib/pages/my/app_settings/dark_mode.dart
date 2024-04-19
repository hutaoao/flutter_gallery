import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gallery/provider/theme.dart';

/// DarkModeWidget
class DarkModeWidget extends StatefulWidget {
  const DarkModeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DarkModeWidgetState();
}

class _DarkModeWidgetState extends State<DarkModeWidget> {

  _followSystem(bool v, BuildContext context) {
    if (v) {
      final theme = MediaQuery.of(context).platformBrightness == Brightness.dark ? 'black' : 'white';
      context.read<ThemeViewModel>().toggleTheme(theme);
      context.read<ThemeViewModel>().changeThemeStr('');
    } else {
      context.read<ThemeViewModel>().toggleTheme('white');
      context.read<ThemeViewModel>().changeThemeStr('white');
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 重要
    final darkModeStr = context.watch<ThemeViewModel>().darkModeStr;

    return Scaffold(
      backgroundColor: const Color(0xf8f8f8f8),
      appBar: AppBar(
          title: const Text('深色模式')
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          SwitchListTile(
            value: darkModeStr == '',
            title: const Text('跟随系统'),
            subtitle: const Text('开启后，将跟随系统打开或关闭深色模式', style: TextStyle(fontSize: 12)),
            tileColor: Colors.white,
            onChanged: (v) => _followSystem(v, context)
          ),
          const SizedBox(height: 15),
          const Text('手动设置'),
          RadioListTile(
            value: "white",
            title: const Text("浅色模式"),
            tileColor: Colors.white,
            controlAffinity: ListTileControlAffinity.trailing,
            groupValue: darkModeStr,
            onChanged: (value) {
              setState(() {
                context.read<ThemeViewModel>().toggleTheme('white');
                context.read<ThemeViewModel>().changeThemeStr('white');
              });
            },
          ),
          const Divider(height: 1, color: Color(0xf8f8f8f8)),
          RadioListTile(
            value: "black",
            title: const Text("深色模式"),
            tileColor: Colors.white,
            controlAffinity: ListTileControlAffinity.trailing,
            groupValue: darkModeStr,
            onChanged: (value) {
              setState(() {
                context.read<ThemeViewModel>().toggleTheme('black');
                context.read<ThemeViewModel>().changeThemeStr('black');
              });
            }
          ),
        ],
      )
    );
  }
}
