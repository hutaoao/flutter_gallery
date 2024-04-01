import 'package:flutter/material.dart';

class HtGridView1 extends StatelessWidget {
  HtGridView1({super.key});

  final List<Color> data = List.generate(128, (i) => Color(0xFFFF00FF - 2 * i));

  Container _builderItem(Color color) => Container(
    alignment: Alignment.center,
    width: 100,
    height: 30,
    color: color,
    child: Text(
      colorString(color),
      style: const TextStyle(
        color: Colors.white
      ),
    ),
  );

  String colorString(Color color) => '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.count(
        scrollDirection: Axis.vertical, /// 滑动方向
        reverse: true, /// 是否反向滑动
        crossAxisCount: 4, /// 主轴一行数量
        mainAxisSpacing: 2, /// 主轴每行间距
        crossAxisSpacing: 2, /// 次轴每行间距
        childAspectRatio: 1 / 0.618,
        children: data.map((color) => _builderItem(color)).toList(),
      ),
    );
  }
}
