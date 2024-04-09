import 'package:flutter/material.dart';

class HtAnimatedContainer1 extends StatefulWidget {
  const HtAnimatedContainer1({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedContainer1State();
}

class _HtAnimatedContainer1State extends State<HtAnimatedContainer1> {
  bool selected = false;

  void onChanged(bool value) {
    setState(() {
      selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: selected,
          onChanged: onChanged
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: selected ? Colors.blue : Colors.red,
          width: 100,
          height: selected ? 200 : 100,
          transform: selected ? Matrix4.translationValues(-100, 0, 0) : Matrix4.translationValues(0, 0, 0),
        )
      ],
    );
  }
}
