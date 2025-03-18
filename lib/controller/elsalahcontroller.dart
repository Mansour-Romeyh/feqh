import 'package:feqh/core/const/approutes.dart';
import 'package:feqh/core/const/soundpath.dart';
import 'package:feqh/model/data/soundscreens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Elsalahcontroller extends GetxController {
 ScrollController scrollController = ScrollController();
  List<SoundModel> data = datasound; 
String title = 'كِتَابُ الصَّلَاة';
  void gotoplaymusic(int i) {
    Get.toNamed(Approutes.musiclayer, arguments: {"index": i, "data": data,'path':Soundpath.elsalah,'title':title});
}
}