import 'package:flutter/material.dart';

class HtText1 extends StatelessWidget {
  const HtText1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.grey),
      child: const Text(
        'hello flutter',
        style: TextStyle(
          color: Colors.blue,
          backgroundColor: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 3
        ),
      ),
    );
  }
}
