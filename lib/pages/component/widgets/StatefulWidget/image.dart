import 'package:flutter/material.dart';

class HtImage extends StatefulWidget {
  const HtImage({super.key});

  @override
  State<StatefulWidget> createState() => _HtImageState();
}

class _HtImageState extends State<HtImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network('https://qiniu.public.hutaoao.cn/invitation/1.jpg');
  }
}
