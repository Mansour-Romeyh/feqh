import 'package:audioplayers/audioplayers.dart';
import 'package:feqh/core/const/approutes.dart';
import 'package:get/get.dart';

class Splashcontroller extends GetxController {
 static AudioPlayer  audioplayer = AudioPlayer();
  gotOnpording() {
    Get.offNamed(Approutes.onpording);
  }

  @override
  void onInit() {
    audioplayer.play(AssetSource('sound/men.mp3'));
    Future.delayed(Duration(seconds: 4), () {
      gotOnpording();
    });
    super.onInit();
  }
  @override
  void dispose() {
  audioplayer.dispose();
    super.dispose();
  }
}
