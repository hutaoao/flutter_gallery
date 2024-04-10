import 'package:flutter/material.dart';

class HtSlideTransition2 extends StatefulWidget {
  const HtSlideTransition2({super.key});

  @override
  State<StatefulWidget> createState() => _HtSlideTransition2State();
}

class _HtSlideTransition2State extends State<HtSlideTransition2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, /// 让程序和手机的刷新频率一致
      duration: const Duration(milliseconds: 1000),
    )..reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _controller.drive(
                  Tween(
                    begin: const Offset(0, 0),
                    end: const Offset(0.8, 0)
                  ).chain(
                    CurveTween(
                      curve: const Interval(0, 0.2)
                    )
                  )
                ),
                child: Container(
                  width: 120,
                  height: 60,
                  color: Colors.blue[200],
                ),
              ),
              SlideTransition(
                position: _controller.drive(
                  Tween(
                    begin: const Offset(0, 0),
                    end: const Offset(0.8, 0)
                  ).chain(
                    CurveTween(
                      curve: const Interval(0.1, 0.3)
                    )
                  )
                ),
                child: Container(
                  width: 120,
                  height: 60,
                  color: Colors.blue[400],
                ),
              ),
              SlideTransition(
                position: _controller.drive(
                  Tween(
                    begin: const Offset(0, 0),
                    end: const Offset(0.8, 0)
                  ).chain(
                    CurveTween(
                      curve: const Interval(0.2, 0.4)
                    )
                  )
                ),
                child: Container(
                  width: 120,
                  height: 60,
                  color: Colors.blue[600],
                ),
              ),
              SlideTransition(
                position: _controller.drive(
                  Tween(
                    begin: const Offset(0, 0),
                    end: const Offset(0.8, 0)
                  ).chain(
                    CurveTween(
                      curve: const Interval(0.3, 0.5)
                    )
                  )
                ),
                child: Container(
                  width: 120,
                  height: 60,
                  color: Colors.blue[800],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
