import 'package:feqh/core/const/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Appfonts {
final double sizefont;
 Appfonts({required this.sizefont});
  static TextStyle fontlogo = GoogleFonts.amiriQuran(
    textStyle: TextStyle(color: Appcolors.gray)
  );
 static TextStyle fontname = GoogleFonts.taviraj(
    textStyle: TextStyle(color: Appcolors.whiet,fontSize: 30)
  );
  static TextStyle fonttagwal = GoogleFonts.tajawal(
    textStyle: TextStyle(color: Appcolors.whiet,fontSize: 23)
  );
 
  
}