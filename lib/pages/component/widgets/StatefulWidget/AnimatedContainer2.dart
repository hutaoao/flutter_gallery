import 'package:flutter/material.dart';

class HtAnimatedContainer2 extends StatefulWidget {
  const HtAnimatedContainer2({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedContainer2State();
}

class _HtAnimatedContainer2State extends State<HtAnimatedContainer2> {
  bool selected = false;

  void onChanged(bool value) {
    setState(() {
      selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.grey,
      child: Stack(
        children: [
          Positioned(
            left: 100,
            top: 0,
            child: Switch(
              value: selected,
              onChanged: onChanged
            ),
          ),
          Positioned(
            left: 0,
            top: 50,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: Colors.red,
              width: 100,
              height: 100,
              transform: selected ? Matrix4.translationValues(200, 50, 0) : Matrix4.translationValues(0, 0, 0),
            ),
          )
        ],
      ),
    );
  }
}
