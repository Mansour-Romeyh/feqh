import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:feqh/controller/onpordingcontroller.dart';
import 'package:feqh/core/const/Appfonts.dart';
import 'package:feqh/core/const/appcolors.dart';
import 'package:feqh/view/widgets/button.dart';
import 'package:feqh/view/widgets/imagonpording.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onpordingscreen extends StatelessWidget {
  const Onpordingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Onpordingcontroller controller = Get.put(Onpordingcontroller());
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      bottomNavigationBar: Button(
            onPressed: () {
              controller.gothomescreen();
            },
          ),
      backgroundColor:  Color(0xFFFFFDEE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Imagonpording(),
         SelectableText('الدُّكْتُورِ : عَــدْنَانُ بْنُ عَوْضٍ الرَّشِيدِيّ عُضْوُ هَيْئَةِ التَّدْرِيسِ بِجَامِعَةِ الكُوَيْت Dr.adnan1401@gmail.com',style: Appfonts.fontname.copyWith(color: Appcolors.brawen,fontSize: width/14)
         ,textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
          SizedBox(height: 15,)
          
        ],
      ),
    );
  }
}
