import 'package:flutter/material.dart';

class HtSlideTransition1 extends StatefulWidget {
  const HtSlideTransition1({super.key});

  @override
  State<StatefulWidget> createState() => _HtSlideTransition1State();
}

class _HtSlideTransition1State extends State<HtSlideTransition1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, /// 让程序和手机的刷新频率一致
      duration: const Duration(milliseconds: 2000),
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
          const Divider(height: 20),
          SlideTransition(
            /// 这里的Offset里面数字代表子元素的宽高倍数
            position: Tween(
                begin: const Offset(0, 0),
                end: const Offset(2, 6)
            )
                .chain(CurveTween(curve: Curves.easeInBack)) /// 配置动画曲线
                .chain(CurveTween(curve: const Interval(0.4, 0.6))) /// 当前时间点的%40开始运动，%60结束运动
                .animate(_controller),
            /// 第二种方式
            // position: _controller.drive(Tween(begin: const Offset(0, 0), end: const Offset(2, 1))),
            child: const Icon(Icons.radio, size: 60, color: Colors.red),
          )
        ],
      ),
    );
  }
}
