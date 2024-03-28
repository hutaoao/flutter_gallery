import 'package:flutter/material.dart';

class HtListView2 extends StatelessWidget {
  HtListView2({super.key});

  final List<Color> data = [
    Colors.purple[100]!,
    Colors.purple[200]!,
    Colors.purple[300]!,
    Colors.purple[400]!,
    Colors.purple[500]!,
    Colors.purple[600]!,
    Colors.purple[700]!,
    Colors.purple[800]!,
    Colors.purple[900]!,
  ];

  String colorString(Color color) => '#${color.value.toRadixString(16).padLeft(8, '0').toLowerCase()}';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        /// 是否方向滑动
        reverse: true,
        /// 无边界时是否包裹
        shrinkWrap: true,
        /// 滑动方向 - 横向
        scrollDirection: Axis.horizontal,
        children: data.map((color) => Container(
          width: 100,
          height: 50,
          color: color,
          alignment: Alignment.center,
          child: Text(colorString(color), style: const TextStyle(color: Colors.white)),
        )).toList(),
      ),
    );
  }
}
