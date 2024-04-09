import 'package:flutter/material.dart';

class HtAnimatedPositioned1 extends StatefulWidget {
  const HtAnimatedPositioned1({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedPositioned1State();
}

class _HtAnimatedPositioned1State extends State<HtAnimatedPositioned1> {
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
        Container(
          width: 400,
          height: 200,
          color: Colors.grey,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.slowMiddle,
                left: selected ? 300 : 0,
                top: selected ? 160 : 0,
                child: const Icon(Icons.home, color: Colors.red, size: 50),
              )
            ],
          ),
        )
      ],
    );
  }
}
