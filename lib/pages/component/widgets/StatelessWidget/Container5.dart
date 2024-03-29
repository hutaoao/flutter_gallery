import 'package:flutter/material.dart';

class HtContainer5 extends StatelessWidget {
  const HtContainer5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.blue,
      /// 受 constraints 约束最大最小宽高
      constraints: const BoxConstraints(
        minWidth: 20,
        maxWidth: 120,
        minHeight: 20,
        maxHeight: 50
      ),
    );
  }
}
