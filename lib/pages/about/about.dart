import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gallery/utils/storage/storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 关于我
class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  final storage = Storage();

  _logout() {
    print('1111');
    storage.clear();
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xf8f8f8f8),
      body: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('张三'),
            accountEmail: Text('zhangsan@goole.com'),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image1.jpg'),
                fit: BoxFit.cover
              )
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://qiniu.public.hutaoao.cn/invitation/1.jpg'),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const ListTile(
                  title: Text('应用管理'),
                  leading: Icon(Icons.window),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                  tileColor: Colors.white,
                ),
                const Divider(height: 1, color: Color(0xf8f8f8f8)),
                const ListTile(
                  title: Text('数据管理'),
                  leading: Icon(Icons.data_exploration),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                  tileColor: Colors.white,
                ),
                const Divider(height: 1, color: Color(0xf8f8f8f8)),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text('我的收藏'),
                    leading: Icon(Icons.collections),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                    tileColor: Colors.white,
                  ),
                ),
                const ListTile(
                  title: Text('版本信息'),
                  leading: Icon(Icons.verified_sharp),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                  tileColor: Colors.white,
                ),
                const Divider(height: 1, color: Color(0xf8f8f8f8)),
                const ListTile(
                  title: Text('关于应用'),
                  leading: Icon(Icons.sailing),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                  tileColor: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text('联系我'),
                    leading: Icon(Icons.contacts),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                    tileColor: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// 此处按钮自定义大小 外面必须有个Row
                    Container(
                      width: 0.9.sw,
                      height: 50,
                      margin: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        onPressed: _logout,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                          )
                        ),
                        child: const Text('退出登录'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
