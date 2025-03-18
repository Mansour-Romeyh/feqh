import 'package:feqh/core/const/Appfonts.dart';
import 'package:feqh/core/const/appcolors.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final VoidCallback onPressed;
  const Button({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.sizeOf(context).width;
     double height = MediaQuery.sizeOf(context).height;
    return Padding(
            padding:  EdgeInsets.only(left: width/16, right:width/16, bottom: height/30),
            child: MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              color: Appcolors.brawen,
              onPressed: onPressed,
              child: Text('تابع', style: Appfonts.fontname),
            ),
          );
  }
}