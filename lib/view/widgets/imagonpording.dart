import 'package:feqh/core/const/appimgs.dart';
import 'package:flutter/widgets.dart';

class Imagonpording extends StatelessWidget {
  const Imagonpording({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return  ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(width / 1.3),
            ),
            child: Image.asset(
              height: height / 1.5,
              Appimgs.logo2,
              fit: BoxFit.fill,
            ),
          );
  }
}