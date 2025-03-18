import 'package:feqh/core/const/appcolors.dart';
import 'package:flutter/material.dart';

ThemeData themeData (){

  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 228, 235, 238),
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.brawen,
      iconTheme: IconThemeData(
        color: Appcolors.whiet
      )
    )
  );
}