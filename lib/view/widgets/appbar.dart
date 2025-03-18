import 'package:feqh/core/const/Appfonts.dart';
import 'package:feqh/core/const/appcolors.dart' show Appcolors;
import 'package:feqh/core/const/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Appbar extends StatelessWidget {
  final String title;
  const Appbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: height/15,right: 10,left: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: Appcolors.brawen),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Appfonts.fontname.copyWith(fontSize: width/12),
            textAlign: TextAlign.center,
          ),
          GestureDetector(
          
           onTap:  (){
            Get.toNamed(Approutes.favorite);
          }, child:   Icon(Icons.favorite, color: Color.fromRGBO(179, 13, 13, 1),size: 40,))
        ],
      ),
    );
  }
}
