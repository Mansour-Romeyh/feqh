import 'package:feqh/core/const/themdata.dart';
import 'package:feqh/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized;
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
  
    return GetMaterialApp(
      locale: Locale('ar'),
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      getPages: getPages);
  }
}
