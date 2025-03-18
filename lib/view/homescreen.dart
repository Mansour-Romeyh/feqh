import 'package:feqh/controller/homecontroller.dart';
import 'package:feqh/core/const/Appfonts.dart';
import 'package:feqh/core/const/appcolors.dart';
import 'package:feqh/model/data/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homecontroller());
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return GetBuilder<Homecontroller>(
      builder:
          (controller) => Scaffold(
            bottomNavigationBar: Container(
              color: Appcolors.brawen,
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                    databuttombar.length,
                    (index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.changeI(index);
                          },
                          child: Text(
                            databuttombar[index].sections,
                            style: Appfonts.fonttagwal.copyWith(
                              fontSize: width / 21,
                            ),
                          ),
                        ),
                        if (index == controller.i)
                          Container(
                            height: 2,   width: width/8, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: dataHomescreen.elementAt(controller.i),
          ),
    );
  }
}
