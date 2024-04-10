import 'package:flutter/material.dart';

class HtAnimatedIcon2 extends StatefulWidget {
  const HtAnimatedIcon2({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedIcon2State();
}

class _HtAnimatedIcon2State extends State<HtAnimatedIcon2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, /// 让程序和手机的刷新频率一致
      duration: const Duration(milliseconds: 600),
    )..reverse();
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
          const Divider(height: 40),
          Stack(
            children: [
              ScaleTransition(
                scale: _controller.drive(Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: const Interval(0.5, 1)))),
                child: const Icon(Icons.search, size: 50, color: Colors.red),
              ),
              ScaleTransition(
                scale: _controller.drive(Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: const Interval(0, 0.5)))),
                child: const Icon(Icons.close, size: 50, color: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}
