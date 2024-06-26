import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gallery/services/other_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LeaveMessage extends StatefulWidget {
  const LeaveMessage({super.key});

  @override
  State<StatefulWidget> createState() => _LeaveMessageState();
}

class _LeaveMessageState extends State<LeaveMessage> with TickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();
  late AnimationController _ctrl;
  late Animation<Offset> animation1;
  late Animation<Offset> animation2;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400)
    )..forward();

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1 / 4).animate(_ctrl);

    animation1 = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero
    ).animate(_ctrl);

    animation2 = Tween<Offset>(
        begin: const Offset(0, -2),
        end: Offset.zero
    ).animate(_ctrl);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _ctrl.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _onPressedFloatingActionButton() {
    _ctrl.reverse();
    Timer(const Duration(milliseconds: 300), () {
      context.pop();
    });
  }

  void _leaveMessage() async {
    var resp = await OtherService.fetchLeaveMessage({"message": _textEditingController.text});
    if (resp.code != 10000) {
      Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
      return;
    }
    Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideTransition(
              position: animation2,
              child: Container(
                width: 300,
                margin: const EdgeInsets.only(bottom: 30),
                child: TextField(
                  minLines: 5,
                  maxLines: 8,
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '留言...',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: animation1,
              child: SizedBox(
                width: 200,
                height: 46,
                child: ElevatedButton(
                  onPressed: _leaveMessage,
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.redAccent), // 背景颜色
                    foregroundColor: const MaterialStatePropertyAll(Colors.white), // 文字/图标 颜色
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // 配置圆角 - 默认圆角
                      )
                    ),
                  ),
                  child: const Text('留言', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(33)),
          child: ClipOval(
            child: FloatingActionButton(
              onPressed: _onPressedFloatingActionButton,
              backgroundColor: Colors.amber,
              child: RotationTransition(
                turns: CurvedAnimation(
                  parent: _rotationAnimation,
                  curve: Curves.linear
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 26),
              ),
            ),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
