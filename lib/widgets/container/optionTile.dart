import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/responsive.dart';
import 'package:quiz_app/widgets/text/textstyle.dart';

class OptionTile extends StatelessWidget {

  Screen? size;
  final String option;
  final Color color;
  OptionTile({required this.option,required this.color,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: ListTile(
        title: CustomeText(child: option, size: 0.0275, fontWeight: FontWeight.w500, color: textColor),
      ),
    );
  }
}
