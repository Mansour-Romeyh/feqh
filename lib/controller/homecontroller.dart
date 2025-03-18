import 'package:get/get.dart';

class Homecontroller extends GetxController {
  int i = 0;
  void changeI(int index) {
    i = index;
    update();
  }
}
