import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class CustomeText extends StatelessWidget {
  late String child;
  late double size;
  late FontWeight fontWeight;
  late Color color;
  CustomeText({required this.child,required this.size,required this.fontWeight,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(child,
      style: TextStyle(
        fontFamily: 'Kanit',
        fontSize: MediaQuery.of(context).size.height * size,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none
      )
    );
  }
}
