
import 'package:get/get.dart';

class SoundController extends GetxController {
  var isScrollingUp = false.obs;
  double previousOffset = 0.0;

  void updateScrollOffset(double currentOffset) {
    isScrollingUp.value = currentOffset < previousOffset;
    previousOffset = currentOffset;
  }
}
