import 'package:flutter/material.dart';

class HtContainer2 extends StatelessWidget {
  const HtContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.yellow),
      alignment: Alignment.bottomRight,
      child: const Icon(Icons.face, color: Colors.black54),
    );
  }
}
