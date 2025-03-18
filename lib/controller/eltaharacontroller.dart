import 'package:feqh/core/const/approutes.dart';
import 'package:feqh/core/const/soundpath.dart';
import 'package:feqh/model/data/soundscreens.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Eltaharacontroller extends GetxController {
  ScrollController scrollController = ScrollController();
  List<SoundModel> data = datasound.sublist(0, 40); 
String title = 'كِتَابُ الطَّهَارَة';
  void gotoplaymusic(int i) {
Get.toNamed(Approutes.musiclayer, arguments: {"index": i, "data": data,'path':Soundpath.tahara,'title':title});
  }
}
