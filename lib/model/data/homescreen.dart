import 'package:feqh/view/elhegscreen.dart';
import 'package:feqh/view/elsalahscreen.dart';
import 'package:feqh/view/elseyamscreen.dart';
import 'package:feqh/view/eltaharascreen.dart';
import 'package:feqh/view/elzakahscreen.dart';
import 'package:flutter/widgets.dart';

class Buttombardata {
  final String sections;

  Buttombardata({required this.sections});
}

List<Buttombardata> databuttombar = [
  Buttombardata(sections: 'الطهاره'),
  Buttombardata(sections: 'الصلاه'),
   Buttombardata(sections: 'الزكاه'),
  Buttombardata(sections: 'الصيام'),
  Buttombardata(sections: 'الحج'),
];
List<Widget> dataHomescreen = [
  Eltaharascreen(),
  Elsalahscreen(),
  Elzakahscreen(),
  Elseyamscreen(),
  
  Elhegscreen()
];
