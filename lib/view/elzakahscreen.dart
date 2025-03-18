
import 'package:feqh/controller/elzakahcontroller.dart';
import 'package:feqh/view/widgets/appbar.dart';
import 'package:feqh/view/widgets/sounditems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class Elzakahscreen extends GetView<Elzakahcontroller> {
  const Elzakahscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Elzakahcontroller());
    return Column(
      children: [
      Appbar(title:'كِتَابُ الزَّكَاة (23 حلقه)',),
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
