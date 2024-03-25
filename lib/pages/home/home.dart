import 'package:flutter/material.dart';
import 'package:flutter_gallery/provider/user_model.dart';
import 'package:flutter_gallery/provider/theme_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
      body: Column(
        children: [
          Container(
            width: 0.5.sw,
            height: 0.5.sw,
            color: Colors.red,
            child: Consumer2<ThemeModel, UserModel>(
              builder: (_, themeModel, userModel, child) {
                return ElevatedButton(
                  onPressed: () {
                    // context.push('/login');
                    storage.removeStorage('token');
                    themeModel.toggleTheme();
                    userModel.add();
                  },
                  child: const Text('切换主题'),
                );
              },
            )
          ),
          Consumer<UserModel>(
            builder: (_, userModel, child) {
              return Text(userModel.counter.toString());
            },
          )
        ],
      ),
    );
  }
}
