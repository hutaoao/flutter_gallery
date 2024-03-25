import 'package:flutter/material.dart';
import 'package:flutter_gallery/apis/user.dart';
import 'package:go_router/go_router.dart';

/// 语雀
class YuQueWidget extends StatefulWidget {
  const YuQueWidget({super.key});

  @override
  State<StatefulWidget> createState() => _YuQueWidgetState();
}

class _YuQueWidgetState extends State<YuQueWidget> {
  late int _pageNum = 1;
  late int _total = 1;
  late bool _isLoading = false;
  late List dataList = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMoreListener();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  // 获取数据
  Future getData() async {
    Map params = {'current': _pageNum, 'pageSize': 10};
    _isLoading = true;
    var resp = await UserApi.getYuQueDocs(params);
    _isLoading = false;
    _total = resp['data']['total'];
    dataList.addAll(resp['data']['list']);
    return dataList;
  }

  // 下拉刷新
  Future<void> _onRefresh() async {
    dataList = [];
    setState(() {
      _pageNum = 1;
    });
  }

  // 下拉监听 获取更多数据
  getMoreListener() {
    _scrollController.addListener(() {
      if (!_isLoading && _scrollController.position.atEdge) {
        setState(() {
          _pageNum++;
        });
      }
    });
  }

  // 渲染footer - 加载更多loading
  Widget renderFooter() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child:  const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
            SizedBox(width: 20),
            Text('加载中，请稍候'),
          ],
        ),
      ),
    );
  }

  // 渲染footer - 加载完成
  Widget renderFinish() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child:  const Text('已全部加载'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的语雀'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && _pageNum == 1) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), SizedBox(height: 10), Text('加载中，请稍候')],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.separated(
              controller: _scrollController,
              itemCount: snapshot.data.length,
              /// 列表项构造器
              itemBuilder: (BuildContext context, int index) {
                /// 全部加载完
                if (snapshot.data.length == _total) {
                  return renderFinish();
                } else {
                  /// 加载到最后一项显示loading
                  if (index == snapshot.data.length - 1) {
                    return renderFooter();
                  }
                }
                return ListTile(
                  title: Text('${snapshot.data[index]['title']}', overflow: TextOverflow.ellipsis),
                  subtitle: Text('${snapshot.data[index]['published_at']}'),
                  trailing: Image.network(
                    'https://gw.alipayobjects.com/zos/rmsportal/mqaQswcyDLcXyDKnZfES.png',
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    context.push('/yuque-detail/${snapshot.data[index]['slug']}');
                  },
                );
              },
              /// 分割器构造器
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          );
        },
      ),
    );
  }
}
