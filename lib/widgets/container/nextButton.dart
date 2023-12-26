import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/responsive.dart';
import 'package:quiz_app/widgets/text/textstyle.dart';

class NextButton extends StatelessWidget {
  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Container(
      width: size?.wp(40),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomeText(child: 'NEXT', size: 0.03, fontWeight: FontWeight.w600, color: primaryColor),
          SizedBox(width: size?.wp(3),),
          Icon(Icons.arrow_forward,color: primaryColor,size: size?.hp(4),)
        ],
      ),
    );
  }
}
