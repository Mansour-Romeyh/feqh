
import 'package:feqh/controller/eltaharacontroller.dart';
import 'package:feqh/view/widgets/appbar.dart';
import 'package:feqh/view/widgets/sounditems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Eltaharascreen extends GetView<Eltaharacontroller> {
  const Eltaharascreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Eltaharacontroller());
    return Column(
      children: [
        Appbar(title: 'كِتَابُ الطَّهَارَة (40 حلقه)'),
        Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: controller.data.length,

        itemBuilder: (context, index) {
          return Sounditems(index: index, name_ar: controller.data[index].name_ar, onTap: (){
            controller.gotoplaymusic(index);
          }, scrollController: controller.scrollController,);

        }))
      ],
    );
  }
}
