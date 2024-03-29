import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import 'package:flutter_gallery/models/component_model.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atelier-cave-light.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:share_plus/share_plus.dart';

class ComponentDetail extends StatefulWidget {
  final ComponentModel extraData;

  const ComponentDetail({super.key, required this.extraData});

  @override
  State<StatefulWidget> createState() => _ComponentDetailState();
}

class _ComponentDetailState extends State<ComponentDetail> {
  List<Map> dataList = [];

  _showCode(int i, bool v) async {
    // 判断是否已经存在过，不要做重复读取操作
    if (dataList[i]['content'] != '') {
      setState(() {
        dataList[i]['show'] = !dataList[i]['show'];
      });
      return;
    }
    String fileName = '${widget.extraData.widgetName}${i + 1}';
    // 读取文件转为字符串
    String fileText = await rootBundle.loadString('lib/pages/component/widgets/${widget.extraData.catalogue}/$fileName.dart');
    setState(() {
      dataList[i]['show'] = true;
      dataList[i]['content'] = fileText;
    });
  }

  // code 区域
  Widget _renderCode(int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      child: dataList[index]['show'] ? Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: HighlightView(
              // The original code to be highlighted
              dataList[index]['content'],

              // Specify language
              // It is recommended to give it a value for performance
              language: 'dart',

              // Specify highlight theme
              // All available themes are listed in `themes` folder
              theme: atelierCaveLightTheme,

              // Specify padding
              padding: const EdgeInsets.all(16),

              // Specify text style
              textStyle: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 10,
            child: GestureDetector(
              onTap: () {
                Share.share('${dataList[index]['content']}');
              },
              child: const Icon(Icons.share, size: 18, color: Colors.green),
            ),
          )
        ],
      )
          : const SizedBox(),
    );
  }

  // 遍历渲染子节点
  List<Widget> _renderChild() {
    List<Widget> list = [];
    List<Map> data = WidgetsMap.map(widget.extraData.widgetName);

    for (int index = 0; index < data.length; index++) {
      dataList.add({'show': false, 'content': ''});
      list.add(Card(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              title: Text('⚡${data[index]['title']}'),
              trailing: RotatableIcon(handleClick: (bool v) => _showCode(index, v)),
            ),
            data[index]['widget'],
            _renderCode(index),
          ],
        ),
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.extraData.widgetName),
      ),
      body: ListView(
        children: _renderChild(),
      ),
    );
  }
}

/// 能旋转的Icon组件
class RotatableIcon extends StatefulWidget {
  final Function? handleClick;

  const RotatableIcon({super.key, this.handleClick});

  @override
  State<StatefulWidget> createState() => _RotatableIconState();
}

class _RotatableIconState extends State<RotatableIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isRotate = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rotateIcon() {
    if (_controller.isDismissed) {
      _controller.animateTo(0.25);
    } else {
      _controller.reverse();
    }
    isRotate = !isRotate;
    widget.handleClick!(isRotate);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _rotateIcon,
      child: RotationTransition(
        turns: _controller,
        child: const Icon(Icons.code, color: Colors.red),
      ),
    );
  }
}
