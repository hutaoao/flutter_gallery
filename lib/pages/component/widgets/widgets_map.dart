import 'package:flutter/material.dart';

import 'exp/other_unit.dart';
import 'exp/proxy_unit.dart';
import 'exp/render_object_unit.dart';
import 'exp/sliver_unit.dart';
import 'exp/stateful_unit.dart';
import 'exp/stateless_unit.dart';

class WidgetsMap {
  static List<Map> map(String name) {
    switch (name) {
      case "Container":
        return [
          {'title': '用于显示一个指定宽高的区域', 'widget': const HtContainer1()},
          {'title': '用于显示一个指定颜色的区域', 'widget': const HtContainer2()},
        ];
      case "Image":
        return [
          {'title': '显示一个网络图片', 'widget': const HtImage1()},
        ];
      default:
        return [
          {'title': '默认文本', 'widget': const Text('default')},
        ];
    }
  }

  static Map widgetList = {
    'StatelessWidget': [
      {
        'widgetName': 'Container',
        'localName': '容器组件',
        'widgetIntroduction': '用于容纳单个子组件的容器组件。集成了若干个单子组件的功能，如内外边距、形变、装饰、约束等...',
      }
    ],
    'StatefulWidget': [
      {
        'widgetName': 'Image',
        'localName': '图片组件',
        'widgetIntroduction': '用于显示一张图片',
      }
    ],
    'SingleChildRenderObjectWidget': [],
    'MultiChildRenderObjectWidget': [],
    'SliverWidget': [],
    'ProxyWidget': [],
    'OtherWidget': [],
  };
}

