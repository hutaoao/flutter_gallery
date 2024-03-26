import 'package:flutter/material.dart';

import 'exp/other_unit.dart';
import 'exp/proxy_unit.dart';
import 'exp/render_object_unit.dart';
import 'exp/sliver_unit.dart';
import 'exp/stateful_unit.dart';
import 'exp/stateless_unit.dart';

class WidgetsMap {
  static Widget map(String name) {
    switch (name) {
      case "Container":
        return const HtContainer();
      case "Image":
        return const HtImage();
      default:
        return const Text('default');
    }
  }

  static Map widgetList = {
    '无态': [
      {
        'widgetName': 'Container',
        'localName': '容器组件',
        'widgetIntroduction': '用于容纳单个子组件的容器组件。集成了若干个单子组件的功能，如内外边距、形变、装饰、约束等...',
      }
    ],
    '有态': [
      {
        'widgetName': 'Image',
        'localName': '图片组件',
        'widgetIntroduction': '用于显示一张图片',
      }
    ],
    '单渲': [],
    '多渲': [],
    '滑片': [],
    '代理': [],
    '其它': [],
  };
}

