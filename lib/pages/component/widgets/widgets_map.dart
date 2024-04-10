import 'package:flutter/material.dart';

import 'exp/other_unit.dart';
import 'exp/proxy_unit.dart';
import 'exp/multi_unit.dart';
import 'exp/single_unit.dart';
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
          {'title': '装饰 - decoration', 'widget': const HtContainer3()},
          {'title': '变换性 - transform', 'widget': const HtContainer4()},
          {'title': '约束性 - constraints', 'widget': const HtContainer5()},
        ];
      case "Text":
        return [
          {'title': '文字的基本样式', 'widget': const HtText1()},
          {'title': '文字阴影 - shadows', 'widget': const HtText2()},
          {'title': '文字阴影 - decoration', 'widget': const HtText3()},
          {'title': '文字对齐方式 - textAlign', 'widget': const HtText4()},
          {'title': '文字方向 textDirection / 最大行数 maxLines', 'widget': const HtText5()},
          {'title': '是否包裹与越界效果', 'widget': const HtText6()},
        ];
      case "ListView":
        return [
          {'title': '基本使用', 'widget': HtListView1()},
          {'title': '横向滑动', 'widget': HtListView2()},
          {'title': 'ListView.builder构造', 'widget': HtListView3()},
          {'title': 'ListView.separated构造', 'widget': HtListView4()},
        ];
      case "GestureDetector":
        return [
          {'title': '基本事件', 'widget': const HtGestureDetector1()},
          {'title': '详细信息', 'widget': const HtGestureDetector2()},
          {'title': 'Pan事件', 'widget': const HtGestureDetector3()},
        ];
      case "GridView":
        return [
          {'title': 'GridView.count构造', 'widget': HtGridView1()},
          {'title': 'GridView.extent构造', 'widget': HtGridView2()},
          {'title': 'GridView.builder构造', 'widget': HtGridView3()},
        ];
      case "Image":
        return [
          {'title': '显示一个网络图片', 'widget': const HtImage1()},
        ];
      case "AnimatedContainer":
        return [
          {'title': '基本使用', 'widget': const HtAnimatedContainer1()},
          {'title': '配合Stack使用', 'widget': const HtAnimatedContainer2()},
        ];
      case "AnimatedPadding":
        return [
          {'title': '基本使用', 'widget': const HtAnimatedPadding1()},
        ];
      case "AnimatedOpacity":
        return [
          {'title': '基本使用', 'widget': const HtAnimatedOpacity1()},
        ];
      case "AnimatedPositioned":
        return [
          {'title': '基本使用', 'widget': const HtAnimatedPositioned1()},
        ];
      case "AnimatedDefaultTextStyle":
        return [
          {'title': '基本使用', 'widget': const HtAnimatedDefaultTextStyle1()},
        ];
      case "AnimatedSwitcher":
        return [
          {'title': '基本使用', 'widget': const HtAnimatedSwitcher1()},
          {'title': '配合TransitionBuilder使用', 'widget': const HtAnimatedSwitcher2()},
        ];
      case "RotationTransition":
        return [
          {'title': '基本使用', 'widget': const HtRotationTransition1()},
        ];
      case "FadeTransition":
        return [
          {'title': '基本使用', 'widget': const HtFadeTransition1()},
        ];
      case "ScaleTransition":
        return [
          {'title': '基本使用', 'widget': const HtScaleTransition1()},
        ];
      case "SlideTransition":
        return [
          {'title': '基本使用', 'widget': const HtSlideTransition1()},
          {'title': '交互式动画', 'widget': const HtSlideTransition2()},
        ];
      case "AnimatedIcon":
        return [
          {'title': '基本使用', 'widget': const HtAnimatedIcon1()},
          {'title': '交错式动画', 'widget': const HtAnimatedIcon2()},
        ];
      case "Align":
        return [
          {'title': '基本使用', 'widget': const HtAlign1()},
        ];
      case "Stack":
        return [
          {'title': '基本使用', 'widget': const HtStack1()},
          {'title': '结合Positioned使用', 'widget': const HtStack2()},
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
      },
      {
        'widgetName': 'GestureDetector',
        'localName': '手势监听器',
        'widgetIntroduction': '接受点击、长安、双击、按下、松开、移动等事件，并可以获取触点信息。',
      },
      {
        'widgetName': 'GridView',
        'localName': '网格组件',
        'widgetIntroduction': '以网格的方式容乃多个组件，可以通过count、extent、custom、builder等构造。有内边距、是否方向、滑动控制器等属性。',
      }
    ],
    'StatefulWidget': [
      {
        'widgetName': 'Image',
        'localName': '图片组件',
        'widgetIntroduction': '用于显示一张图片',
      },
      {
        'widgetName': 'AnimatedContainer',
        'localName': '容器动画',
        'widgetIntroduction': '集合alignment、padding、color、decoration、width、height、constraints、margin、transform这个属性皆可动画，可指定时长和曲线，有动画结束事件',
      },
      {
        'widgetName': 'AnimatedPadding',
        'localName': '边距动画',
        'widgetIntroduction': '能让子组件进行Padding动画，可指定时长和曲线，有动画结束事件',
      },
      {
        'widgetName': 'AnimatedOpacity',
        'localName': '透明动画',
        'widgetIntroduction': '能让子组件进行Opacity动画，可指定时长和曲线，有动画结束事件',
      },
      {
        'widgetName': 'AnimatedPositioned',
        'localName': '定位动画',
        'widgetIntroduction': '能让子组件进行Positioned动画，可指定时长和曲线，有动画结束事件。只能用于Stack中',
      },
      {
        'widgetName': 'AnimatedDefaultTextStyle',
        'localName': '容器动画',
        'widgetIntroduction': '能让子文字组件进行TextStyle动画，可指定时长和曲线，有动画结束事件。',
      },
      {
        'widgetName': 'AnimatedSwitcher',
        'localName': '切换动画',
        'widgetIntroduction': '当子组件变化时执行动画，需要指定子组件的key进行标识。动画方式可以自定义，能指定动画时长、动画曲线等属性。',
      },
      {
        'widgetName': 'RotationTransition',
        'localName': '旋转变换',
        'widgetIntroduction': '可容纳一个子组件，并使其进行旋转动画，需要提供动画器turns，拥有alignment属性。',
      },
      {
        'widgetName': 'FadeTransition',
        'localName': '透明变换',
        'widgetIntroduction': '可容纳一个子组件，并使其进行透明度渐变动画，需要提供动画器opacity。',
      },
      {
        'widgetName': 'ScaleTransition',
        'localName': '缩放变换',
        'widgetIntroduction': '可容纳一个子组件，并使其进行缩放动画，需要提供动画器scale，拥有alignment属性。',
      },
      {
        'widgetName': 'SlideTransition',
        'localName': '滑动变换',
        'widgetIntroduction': 'AnimateWidget的子类，使用Offset类型的动画器让子组件在两个Offset对象之间进行过渡动画。',
      },
      {
        'widgetName': 'AnimatedIcon',
        'localName': '图标动画',
        'widgetIntroduction': '使用AnimatedIcons的图标数据，可以根据一个动画控制器来使图标进行动画效果，可指定图标大小、颜色等。',
      }
    ],
    'SingleChildRenderObjectWidget': [
      {
        'widgetName': 'Align',
        'localName': '对齐组件',
        'widgetIntroduction': '可容纳一个子组件，通过alignment让子组件 定位在父组件宽高的任何指定分率处。',
      }
    ],
    'MultiChildRenderObjectWidget': [
      {
        'widgetName': 'Stack',
        'localName': '堆叠组件',
        'widgetIntroduction': '可容纳多个组件，以堆叠的方式摆放子组件，后者居上。',
      }
    ],
    'SliverWidget': [],
    'ProxyWidget': [],
    'OtherWidget': [],
  };
}

