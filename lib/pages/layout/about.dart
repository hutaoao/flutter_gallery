import 'package:flutter/material.dart';
import '../../utils/storage/storage.dart';

/// 关于我
class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  final storage = Storage();

  void _getStore() async {
    var s = await storage.getKeys();
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo'),
      ),
      body: ElevatedButton(
        onPressed: _getStore,
        child: const Text('获取'),
      ),
    );
  }
}
