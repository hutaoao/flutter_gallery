import 'package:flutter/material.dart';

/// 注册
class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('register'),
      ),
      body: const Text('register'),
    );
  }
}
