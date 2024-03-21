/// 此处为Get插件的状态管理（该文件未使用 仅供学习参考）
library;

import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;

  inc() {
    counter.value++;
    update();
  }

  dec() {
    counter.value--;
    update();
  }
}
