import 'package:flutter/material.dart';
import 'package:flutter_gallery/utils/font/alibaba_fount.dart';
import '../home/home.dart';
import '../about/about.dart';
import '../component/component.dart';
import '../publish/publish.dart';
import '../yuque/yuque.dart';

class LayoutWidget extends StatefulWidget {
  final int index;

  const LayoutWidget({super.key, this.index = 0});

  @override
  State<StatefulWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  late int _currentIndex;

  final List _pages = [
    HomeWidget(),
    const YuQueWidget(),
    const PublishWidget(),
    const ComponentWidget(),
    const AboutWidget(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPressedFloatingActionButton() {
    setState(() {
      _currentIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      /// 底部导航配置
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(AliIcon.yuque), label: '语雀'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '留言'),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: '组件'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],

        /// 顶部导航有四个及以上tab需要配置 否则部分会被隐藏
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),

      /// 浮动按钮配置
      floatingActionButton: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(33)),
        child: ClipOval(
          child: FloatingActionButton(
            onPressed: _onPressedFloatingActionButton,
            backgroundColor: _currentIndex == 2 ? Colors.red : Colors.amber[800],
            child: const Icon(Icons.add, color: Colors.white, size: 26),
          ),
        )
      ),

      /// 浮动按钮位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
