import 'package:flutter/material.dart';

class HtText3 extends StatelessWidget {
  const HtText3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'hello flutter',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        /// 下划线厚度
        decorationThickness: 2,
        /// 下划线颜色
        decorationColor: Colors.green,
        /// 下划线样式
        decorationStyle: TextDecorationStyle.wavy
      ),
    );
  }
}
