import 'package:flutter/material.dart';

/// 组件模块
class ComponentWidget extends StatefulWidget {
  const ComponentWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ComponentWidgetState();
}

class _ComponentWidgetState extends State<ComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text('demo');
  }
}
