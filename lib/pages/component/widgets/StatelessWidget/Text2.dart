import 'package:flutter/material.dart';

class HtText2 extends StatelessWidget {
  const HtText2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'hello flutter',
      style: TextStyle(
        fontSize: 50,
        color: Colors.white,
        backgroundColor: Colors.black12,
        shadows: [
          Shadow(
            color: Colors.green,
            offset: Offset(1, 1),
            blurRadius: 10
          ),
          BoxShadow(
            color: Colors.blue,
            offset: Offset(-1, 1),
            blurRadius: 10
          )
        ]
      ),
    );
  }
}
