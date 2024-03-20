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
