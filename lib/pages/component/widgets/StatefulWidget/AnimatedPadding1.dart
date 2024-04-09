import 'package:flutter/material.dart';

class HtAnimatedPadding1 extends StatefulWidget {
  const HtAnimatedPadding1({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedPadding1State();
}

class _HtAnimatedPadding1State extends State<HtAnimatedPadding1> {
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
        Switch(value: selected, onChanged: onChanged),
        Container(
          width: 200,
          height: 200,
          color: Colors.grey,
          child: AnimatedPadding(
            curve: Curves.easeInOut,
            onEnd: () {print('end');},
            padding: selected ? const EdgeInsets.fromLTRB(40, 60, 40, 60) : const EdgeInsets.all(20),
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 100,
              height: 60,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text('Flutter', style: TextStyle(color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}
