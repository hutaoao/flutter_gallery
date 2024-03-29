import 'package:flutter/material.dart';

class HtContainer3 extends StatelessWidget {
  const HtContainer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        /// 渐变色
        gradient: LinearGradient(colors: [Colors.red, Colors.green]),
        /// 圆角
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        /// 阴影
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 1),
            blurRadius: 10,
            spreadRadius: 1
          )
        ]
      ),
      child: const Text('Container', style: TextStyle(fontSize: 20)),
    );
  }
}
