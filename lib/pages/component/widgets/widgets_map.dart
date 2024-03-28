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
          {'title': '可以在区域内放一个子组件', 'widget': const HtContainer2()},
        ];
      case "Text":
        return [
          {'title': '文字的基本样式', 'widget': const HtText1()},
          {'title': '文字阴影', 'widget': const HtText2()},
        ];
      case "ListView":
        return [
          {'title': '基本使用', 'widget': HtListView1()},
          {'title': '横向滑动', 'widget': HtListView2()},
          {'title': 'ListView.builder构造', 'widget': HtListView3()},
          {'title': 'ListView.separated构造', 'widget': HtListView4()},
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
      },
      {
        'widgetName': 'Text',
        'localName': '文字组件',
        'widgetIntroduction': '用于显示文字，核心样式由style属性控制。',
      },
      {
        'widgetName': 'ListView',
        'localName': '列表组件',
        'widgetIntroduction': '可容纳多个子组件，可以通过builder、separated、custom等构造器。',
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

