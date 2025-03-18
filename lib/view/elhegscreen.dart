import 'package:feqh/controller/elhegcontroller.dart';
import 'package:feqh/view/widgets/appbar.dart';
import 'package:feqh/view/widgets/sounditems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Elhegscreen extends GetView<Elhegcontroller> {
  const Elhegscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Elhegcontroller());
    return Column(
      children: [
        Appbar(title:  '   كِتَابُ الْحَجِّ (26 حلقه)'),
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
