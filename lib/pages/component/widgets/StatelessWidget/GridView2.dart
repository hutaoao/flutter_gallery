import 'package:flutter/material.dart';

class HtGridView2 extends StatelessWidget {
  HtGridView2({super.key});

  final List<Color> data = List.generate(128, (i) => Color(0xFF00FFFF - 2 * i));

  Container _builderItem(Color color) => Container(
    alignment: Alignment.center,
    width: 100,
    height: 30,
    color: color,
    child: Text(
      colorString(color),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    ),
  );

  String colorString(Color color) => '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.extent(
        // scrollDirection: Axis.horizontal,
        maxCrossAxisExtent: 80, /// 轴向长度
        mainAxisSpacing: 2, /// 主轴每行间距
        crossAxisSpacing: 2, /// 次轴每行间距
        childAspectRatio: 0.618,
        children: data.map((color) => _builderItem(color)).toList(),
      ),
    );
  }
}
