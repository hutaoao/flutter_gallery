/// 此处为Get插件的状态管理 - 全局绑定（该文件未使用 仅供学习参考）
library;

import 'package:get/get.dart';
import '../controller/counter.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
  }
}
