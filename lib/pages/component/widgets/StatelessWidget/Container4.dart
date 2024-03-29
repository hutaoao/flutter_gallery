import 'package:flutter/material.dart';

class HtContainer4 extends StatelessWidget {
  const HtContainer4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.cyanAccent,
      alignment: Alignment.center,
      transform: Matrix4.skew(10, 0),
      child: const Text('Container', style: TextStyle(fontSize: 20)),
    );
  }
}
