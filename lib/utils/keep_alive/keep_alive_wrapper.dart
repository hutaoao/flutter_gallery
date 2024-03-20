/// 缓存组件
library;

import 'package:flutter/material.dart';

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({super.key, required this.child, this.keepAlive = true});

  final Widget child;
  final bool keepAlive;

  @override
  State<StatefulWidget> createState() => _KeepAliveWrapper();
}

class _KeepAliveWrapper extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.keepAlive;
}
