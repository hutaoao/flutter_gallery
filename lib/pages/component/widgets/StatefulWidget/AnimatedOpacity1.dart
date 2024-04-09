import 'package:flutter/material.dart';

class HtAnimatedOpacity1 extends StatefulWidget {
  const HtAnimatedOpacity1({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedOpacity1State();
}

class _HtAnimatedOpacity1State extends State<HtAnimatedOpacity1> {
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
        AnimatedOpacity(
          curve: Curves.ease,
          duration: const Duration(milliseconds: 600),
          opacity: selected ? 0.1 : 1,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
