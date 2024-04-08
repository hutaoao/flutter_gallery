import 'package:flutter/material.dart';
import 'package:flutter_gallery/utils/font/alibaba_fount.dart';
import 'package:go_router/go_router.dart';
import '../home/home.dart';
import '../about/about.dart';
import '../component/component.dart';
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
    const ComponentWidget(),
    const AboutWidget(),
  ];

  final Map<String, IconData> iconsMap = {
    '首页': Icons.home,
    '语雀': AliIcon.yuque,
    '组件': Icons.widgets,
    '我的': Icons.person,
  };

  List<String> get info => iconsMap.keys.toList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.index;
  }

  void _onPressedFloatingActionButton() {
    context.push('/leave-message');
  }

  Widget _buildChild(int i) {
    bool active = i == _currentIndex;
    return Expanded(
      flex: 1, /// 这里使用Expanded占据所有空间
      child: GestureDetector(
        onTap: () => setState(() => _currentIndex = i),
        child: Container( /// 此处的Container不可少：目的是为了可点击区域大一些
          color: Colors.transparent, /// 此处设置背景色为透明
          child: Column(
            children: [
              Icon(
                iconsMap[info[i]],
                size: 24,
                color: active ? Colors.red : Colors.white,
              ),
              Text(
                info[i],
                style: TextStyle(
                  fontSize: 14,
                  color: active ? Colors.red : Colors.white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /// 获取当前屏幕的宽度
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Scaffold(
        body: _pages[_currentIndex],

        /// 底部导航配置
        bottomNavigationBar: BottomAppBar(
          elevation: 1,
          notchMargin: 5,
          shape: const CircularNotchedRectangle(),
          color: Colors.lime,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: info.asMap().keys.map((i) => _buildChild(i)).toList()
              ..insertAll(2, [const SizedBox(width: 80)]), /// 在索引为2的位置插入一个宽度为30的空盒子作为占位
          ),
        ),

        /// 浮动按钮配置
        floatingActionButton: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(33)),
            child: ClipOval(
              child: FloatingActionButton(
                onPressed: _onPressedFloatingActionButton,
                backgroundColor: Colors.amber,
                child: const Icon(Icons.message, color: Colors.white, size: 26),
              ),
            )
        ),

        /// 浮动按钮位置
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
