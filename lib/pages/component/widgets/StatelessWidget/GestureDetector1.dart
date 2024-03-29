import 'package:flutter/material.dart';

class HtGestureDetector1 extends StatefulWidget {
  const HtGestureDetector1({super.key});

  @override
  State<StatefulWidget> createState() => _HtGestureDetector1State();
}

class _HtGestureDetector1State extends State<HtGestureDetector1> {
  String _info = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {_info = '单击';}),
      onDoubleTap: () => setState(() {_info = '双击';}),
      onLongPress: () => setState(() {_info = '长按';}),
      child: Container(
        width: 200,
        height: 100,
        color: Colors.black12,
        alignment: Alignment.center,
        child: Text(
          _info,
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
