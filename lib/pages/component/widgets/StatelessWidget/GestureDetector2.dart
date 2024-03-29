import 'package:flutter/material.dart';

class HtGestureDetector2 extends StatefulWidget {
  const HtGestureDetector2({super.key});

  @override
  State<StatefulWidget> createState() => _HtGestureDetector2State();
}

class _HtGestureDetector2State extends State<HtGestureDetector2> {
  String _info = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (detail) => setState(() {_info = 'onTapDown：\n相对落点：${detail.localPosition}\n绝对落点：${detail.globalPosition}';}),
      onTapUp: (detail) => setState(() {_info = 'onTapUp：\n相对落点：${detail.localPosition}\n绝对落点：${detail.globalPosition}';}),
      onTapCancel: () => setState(() {_info = 'onTapCancel';}),
      child: Container(
        width: 200,
        height: 100,
        color: Colors.black12,
        alignment: Alignment.center,
        child: Text(
          _info,
          style: const TextStyle(fontSize: 14, color: Colors.blue),
        ),
      ),
    );
  }
}
