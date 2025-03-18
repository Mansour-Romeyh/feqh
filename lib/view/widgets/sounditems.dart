import 'package:feqh/controller/animationcontriller.dart';
import 'package:feqh/core/const/Appfonts.dart';
import 'package:feqh/core/const/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class Sounditems extends StatelessWidget {
  final int index;
  final String name_ar;
  final VoidCallback onTap;
  final ScrollController scrollController;

  Sounditems({
    super.key,
    required this.index,
    required this.name_ar,
    required this.onTap,
    required this.scrollController,
  });

  final SoundController controller = Get.put(SoundController());

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      controller.updateScrollOffset(scrollController.position.pixels);
    });

    return Obx(() => InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  
                  blurRadius: 0,
                  color: const Color.fromARGB(255, 224, 223, 223),
                  offset: Offset( 0,6)
                )
              ],
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              name_ar,
              style: Appfonts.fontname.copyWith(
                fontSize: 30,
                color: Appcolors.brawen,
              ),
              textAlign: TextAlign.start,
            ),
          )
              .animate(delay: (index * (controller.isScrollingUp.value ? 0 : 15)).ms)
              .slideX(
                begin: -1.0,
                end: 0,
                duration: (controller.isScrollingUp.value ? 0 : 15).ms,
                curve: Curves.easeOut,
              )
              .fade(duration: (controller.isScrollingUp.value ? 0 : 15).ms),
        ));
  }
}