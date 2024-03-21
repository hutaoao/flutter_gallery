import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/storage/storage.dart';
import 'package:go_router/go_router.dart';

/// StatelessWidget 无状态组件
class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final storage = Storage();

  @override
  Widget build(BuildContext context) {
    ScreenUtil().setSp(28);
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Container(
        width: 0.5.sw,
        height: 0.5.sw,
        color: Colors.red,
        child: ElevatedButton(
          onPressed: () {
            context.push('/login');
            // storage.setStorage('age', 20);
          },
          child: const Text('存储'),
        ),
      ),
    );
  }
}
