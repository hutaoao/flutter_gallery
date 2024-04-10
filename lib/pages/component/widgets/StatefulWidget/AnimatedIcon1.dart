import 'package:flutter/material.dart';

class HtAnimatedIcon1 extends StatefulWidget {
  const HtAnimatedIcon1({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedIcon1State();
}

class _HtAnimatedIcon1State extends State<HtAnimatedIcon1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this, /// 让程序和手机的刷新频率一致
      duration: const Duration(milliseconds: 600),
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
          const Divider(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedIcon(
                color: Colors.red,
                size: 50,
                icon: AnimatedIcons.close_menu,
                progress: _controller
              ),
              AnimatedIcon(
                color: Colors.red,
                size: 50,
                icon: AnimatedIcons.arrow_menu,
                progress: _controller
              ),
              AnimatedIcon(
                color: Colors.red,
                size: 50,
                icon: AnimatedIcons.play_pause,
                progress: _controller
              ),
              AnimatedIcon(
                color: Colors.red,
                size: 50,
                icon: AnimatedIcons.search_ellipsis,
                progress: _controller
              ),
            ],
          )
        ],
      ),
    );
  }
}
