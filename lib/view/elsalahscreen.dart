import 'package:feqh/controller/elsalahcontroller.dart';
import 'package:feqh/view/widgets/appbar.dart';
import 'package:feqh/view/widgets/sounditems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class Elsalahscreen extends GetView<Elsalahcontroller> {
  const Elsalahscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Elsalahcontroller());
    return Column(
      children: [
        Appbar(title: ' كِتَابُ الصَّلَاة (83 حلقه)'),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.data.length,

            itemBuilder: (context, index) {
              return Sounditems(
                index: index,
                name_ar: controller.data[index].name_ar,
                onTap: () {
                  controller.gotoplaymusic(index);
                },
                scrollController: controller.scrollController,
              );
            },
          ),
        ),
      ],
    );
  }
}
