import 'package:flutter/material.dart';

/// 关于我
class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
              children: const [
                ListTile(
                  title: Text('应用管理'),
                  leading: Icon(Icons.window),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                  tileColor: Colors.white,
                ),
                Divider(height: 1),
                ListTile(
                  title: Text('数据管理'),
                  leading: Icon(Icons.data_exploration),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                  tileColor: Colors.white,
                ),
                Divider(height: 1),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text('我的收藏'),
                    leading: Icon(Icons.collections),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                    tileColor: Colors.white,
                  ),
                ),
                ListTile(
                  title: Text('版本信息'),
                  leading: Icon(Icons.verified_sharp),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                  tileColor: Colors.white,
                ),
                Divider(height: 1),
                ListTile(
                  title: Text('关于应用'),
                  leading: Icon(Icons.sailing),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                  tileColor: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text('联系我'),
                    leading: Icon(Icons.contacts),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.red),
                    tileColor: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
