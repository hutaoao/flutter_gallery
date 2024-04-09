import 'package:flutter/material.dart';

class HtAnimatedSwitcher1 extends StatefulWidget {
  const HtAnimatedSwitcher1({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedSwitcher1State();
}

class _HtAnimatedSwitcher1State extends State<HtAnimatedSwitcher1> {
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
          height: 120,
          color: Colors.grey.withAlpha(22),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            child: selected ? const Icon(Icons.home, size: 50) : const Text('data', style: TextStyle(fontSize: 30)),
          ),
        )
      ],
    );
  }
}
