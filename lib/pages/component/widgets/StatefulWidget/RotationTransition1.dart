import 'package:flutter/material.dart';

class HtRotationTransition1 extends StatefulWidget {
  const HtRotationTransition1({super.key});

  @override
  State<StatefulWidget> createState() => _HtRotationTransition1State();
}

class _HtRotationTransition1State extends State<HtRotationTransition1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, /// 让程序和手机的刷新频率一致
      duration: const Duration(milliseconds: 500)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      color: Colors.grey.withAlpha(22),
      child: Column(
        children: [
          Wrap(
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () => _controller.forward(), /// 向前运动一次
                child: const Text('forward')
              ),
              ElevatedButton(
                onPressed: () => _controller.reverse(), /// 翻转运动一次
                child: const Text('reverse')
              ),
              ElevatedButton(
                onPressed: () => _controller.stop(), /// 停止
                child: const Text('stop')
              ),
              ElevatedButton(
                onPressed: () => _controller.reset(), /// 重置
                child: const Text('reset')
              ),
              ElevatedButton(
                onPressed: () => _controller.repeat(), /// 重复
                child: const Text('repeat')
              )
            ],
          ),
          RotationTransition(
            turns: _controller,
            child: const Icon(Icons.radio, size: 60, color: Colors.red),
          )
        ],
      ),
    );
  }
}
