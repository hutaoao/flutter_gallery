import 'package:flutter/material.dart';

class HtGridView3 extends StatelessWidget {
  HtGridView3({super.key});

  final List<Color> data = List.generate(128, (i) => Color(0xFF33FFFF - 2 * i));

  Container _builderItem(Color color) => Container(
    alignment: Alignment.center,
    width: 100,
    height: 40,
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
      child: GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        /// 网格代理：定交叉轴树木
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, /// 条目个数
          mainAxisSpacing: 5, /// 主轴间距
          crossAxisSpacing: 5, /// 交叉轴间距
          childAspectRatio: 1 / 0.618,
        ),
        itemBuilder: (_, int position) => _builderItem(data[position]),
      ),
    );
  }
}
