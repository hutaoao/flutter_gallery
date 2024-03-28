import 'package:flutter/material.dart';

class HtImage1 extends StatefulWidget {
  const HtImage1({super.key});

  @override
  State<StatefulWidget> createState() => _HtImageState();
}

class _HtImageState extends State<HtImage1> {
  @override
  Widget build(BuildContext context) {
    return Image.network('https://qiniu.public.hutaoao.cn/invitation/1.jpg');
  }
}
