import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/storage/storage.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// StatelessWidget 无状态组件
class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final storage = Storage();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildDrawer() => ListView(
    children: const [
      DrawerHeader(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(left: 30, top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/image1.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Text('hello flutter', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      ListTile(
        leading: Icon(Icons.star, color: Colors.blue),
        title: Text('我的收藏'),
      ),
      ListTile(
        leading: Icon(Icons.palette, color: Colors.orangeAccent),
        title: Text('我的绘画'),
      ),
      ListTile(
        leading: Icon(Icons.file_copy, color: Colors.green),
        title: Text('我的文件'),
      )
    ],
  );

  final Map<String, IconData> menuMap = {
    '关于': Icons.info_outline,
    '帮助': Icons.help_outline,
    '反馈': Icons.add_comment,
  };

  Widget _buildMenu() => PopupMenuButton(
    itemBuilder: (context) => _buildPopupMenuItem(),
    offset: const Offset(0, 50),
    icon: const Icon(Icons.more_vert, color: Colors.teal),
    iconSize: 30,
  );

  List<PopupMenuItem> _buildPopupMenuItem() {
    return menuMap.keys.toList().map((e) => PopupMenuItem(
      value: e,
      child: Wrap(
        spacing: 10,
        children: [
          Icon(menuMap[e], color: Colors.blue),
          Text(e)
        ],
      ),
    )).toList();
  }

  final List<String> imgList = [
    'assets/images/banner/img_1.png',
    'assets/images/banner/img_2.png',
    'assets/images/banner/img_3.png',
    'assets/images/banner/img_4.png',
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil().setSp(28);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('首页'),
        backgroundColor: Colors.amber[100],
        leading: Center(
          child: GestureDetector(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: ClipOval(
              child: Image.asset(
                'assets/images/logo.png',
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => _scaffoldKey.currentState?.openEndDrawer(),
            child: const Icon(Icons.star, size: 36,  color: Colors.red),
          ),
          _buildMenu()
        ],
      ),
      drawer: Drawer(
        child: _buildDrawer(),
      ),
      endDrawer: Drawer(
        child: _buildDrawer(),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200, /// 高度
              viewportFraction: 1, /// 窗口显示比例，默认0.8，想要宽度铺满就选1
              autoPlay: true, /// 自动轮播
            ),
            items: imgList.map((item) => Center(
                child: Image.asset(item, fit: BoxFit.cover, width: 1.sw, height: 200)
            )).toList(),
          ),
        ],
      ),
    );
  }
}
