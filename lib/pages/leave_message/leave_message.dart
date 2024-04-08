import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gallery/apis/user.dart';
import 'package:flutter_gallery/widgets/my_snackbar/my_snackbar.dart';

class LeaveMessage extends StatefulWidget {
  const LeaveMessage({super.key});

  @override
  State<StatefulWidget> createState() => _LeaveMessageState();
}

class _LeaveMessageState extends State<LeaveMessage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  void _onPressedFloatingActionButton() {
    context.pop();
  }

  void _leaveMessage() async {
    var resp = await UserApi.leaveMessage({"message": _textEditingController.text});
    if (resp['code'] == 10000) {
      _textEditingController.text = '';
      return MySnackbar.success(message: resp['msg']);
    }
    MySnackbar.error(message: resp['msg']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
            SizedBox(
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
            )
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
              child: const Icon(Icons.close, color: Colors.white, size: 26),
            ),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
