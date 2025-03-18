import 'package:feqh/core/const/approutes.dart';
import 'package:feqh/view/homescreen.dart';
import 'package:feqh/view/musicplayerscreen.dart';
import 'package:feqh/view/onpordingscreen.dart';
import 'package:feqh/view/splashscreen.dart';
import 'package:feqh/view/favorirescreen.dart';
import 'package:get/route_manager.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: Approutes.splash, page: () => Splashscreen()),
  GetPage(name: Approutes.onpording, page: () => Onpordingscreen()),
  GetPage(name: Approutes.homescreen, page: () => Homescreen()),
  GetPage(name: Approutes.musiclayer, page: () => MusicPlayerScreen()),
  GetPage(name: Approutes.favorite, page: () => FavoritesPage()),
];
