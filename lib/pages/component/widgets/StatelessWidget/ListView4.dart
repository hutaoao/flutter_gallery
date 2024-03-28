import 'package:flutter/material.dart';

class HtListView4 extends StatelessWidget {
  HtListView4({super.key});

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

  Widget _builderItem(Color color) => Container(
    width: 100,
    height: 50,
    color: color,
    alignment: Alignment.center,
    child: Text(colorString(color), style: const TextStyle(color: Colors.white)),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) => _builderItem(data[index]),
        separatorBuilder: (context, index) => const Divider(
          height: 2,
          thickness: 1,
          color: Colors.black54,
        ),
      ),
    );
  }
}
