import 'package:flutter/material.dart';

class HtGestureDetector3 extends StatefulWidget {
  const HtGestureDetector3({super.key});

  @override
  State<StatefulWidget> createState() => _HtGestureDetector3State();
}

class _HtGestureDetector3State extends State<HtGestureDetector3> {
  String _info = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (detail) => setState(() {_info = 'onPanStart：\n相对落点：${detail.localPosition}\n绝对落点：${detail.globalPosition}';}),
      onPanDown: (detail) => setState(() {_info = 'onPanDown：\n相对落点：${detail.localPosition}\n绝对落点：${detail.globalPosition}';}),
      onPanUpdate: (detail) => setState(() {_info = 'onPanUpdate：\n相对落点：${detail.localPosition}\n绝对落点：${detail.globalPosition}';}),
      onPanEnd: (detail) => setState(() {_info = 'onPanEnd：\n初速度：${detail.primaryVelocity}\n最终速度：${detail.velocity}';}),
      onTapCancel: () => setState(() {_info = 'onTapCancel';}),
      child: SingleChildScrollView(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.black12,
          alignment: Alignment.center,
          child: Text(
            _info,
            style: const TextStyle(fontSize: 14, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
