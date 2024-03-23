import 'package:flutter/material.dart';
import 'package:flutter_gallery/apis/user.dart';

/// 语雀
class YuQueWidget extends StatefulWidget {
  const YuQueWidget({super.key});

  @override
  State<StatefulWidget> createState() => _YuQueWidgetState();
}

class _YuQueWidgetState extends State<YuQueWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('111111');
    getDatas();
  }

  Future getDatas() async{
    Map params = {
      'current': 1,
      'pageSize': 10
    };
    var resp = await UserApi.getTags({});
    print(resp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getDatas(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('加载中');
            }
            return const Text('加载完毕');
          },
        ),
      ),
    );
  }
}
