import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:feqh/controller/splashcontroller.dart';
import 'package:feqh/core/const/Appfonts.dart';
import 'package:feqh/core/const/appcolors.dart';
import 'package:feqh/core/const/appimgs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Splashcontroller());
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Appcolors.whiet,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height / 7),
          Image.asset(Appimgs.logo, fit: BoxFit.fill),
          Transform.translate(
            offset: Offset(0, -70),
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TypewriterAnimatedText(
                  'الفِقْهُ ٱلْمُيَسَّرُ فِي ضَوْءِ ٱلْكِتَابِ وَٱلسُّنَّةِ',
                    textStyle: Appfonts.fontlogo.copyWith(fontSize: width / 17),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
