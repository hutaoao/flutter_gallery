import 'package:flutter/material.dart';
import 'package:flutter_gallery/models/component_model.dart';
import 'widgets/widgets.dart';
import 'package:go_router/go_router.dart';

/// 组件模块
class ComponentWidget extends StatefulWidget {
  const ComponentWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ComponentWidgetState();
}

class _ComponentWidgetState extends State<ComponentWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static Map pathMap = {
    'StatelessWidget': '无态',
    'StatefulWidget': '有态',
    'SingleChildRenderObjectWidget': '单渲',
    'MultiChildRenderObjectWidget': '多渲',
    'SliverWidget': '滑片',
    'ProxyWidget': '代理',
    'OtherWidget': '其它',
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  _handleTapTabBar(v) {
    print(v);
  }

  _goToDetail(key, values) {
    final extraData = ComponentModel(catalogue: key, localName: values['localName'], widgetName: values['widgetName']);
    context.go('/widget-detail', extra: extraData);
  }

  Map _renderTabBarView() {
    List<Widget> tabBarViewList = [];
    List<Widget> tabBarTabsList = [];

    WidgetsMap.widgetList.forEach((key, value) {
      var tabBarTabsItem = Tab(child: Text(pathMap[key]));
      var tabBarViewItem = GridView.builder(
        itemCount: value.length, // 网格的总数
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 横轴个数
          mainAxisSpacing: 10, // 主轴间距
          crossAxisSpacing: 10, // 横轴间距
          childAspectRatio: 1.3 // 宽高比
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.black12)
            ),
            child: GestureDetector(
              onTap: () => _goToDetail(key, value[index]),
              child: GridTile(
                header: Text(value[index]['widgetName'], style: const TextStyle(fontSize: 16, color: Colors.black)),
                footer: Text(value[index]['localName'], style: const TextStyle(fontSize: 12, color: Colors.black45)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    value[index]['widgetIntroduction'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ),
              ),
            ),
          );
        },
      );
      tabBarViewList.add(tabBarViewItem);
      tabBarTabsList.add(tabBarTabsItem);
    });

    return {
      'tabBarViewList': tabBarViewList,
      'tabBarTabsList': tabBarTabsList
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          bottom: TabBar(
            onTap: _handleTapTabBar,
            isScrollable: true,
            // 较多时可以滚动
            indicatorColor: Colors.red,
            //指示器颜色
            indicatorSize: TabBarIndicatorSize.label,
            //指示器大小
            labelColor: Colors.red,
            //选中label颜色
            controller: _tabController,
            tabs: _renderTabBarView()['tabBarTabsList'],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _renderTabBarView()['tabBarViewList'],
      ),
    );
  }
}
