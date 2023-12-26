import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/responsive.dart';
import 'package:quiz_app/widgets/text/textstyle.dart';

class QuestionWidget extends StatelessWidget {

  final String question;
  final int indexAction;
  final int totalQuestions;

  QuestionWidget({required this.question,required this.indexAction,required this.totalQuestions});

  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomeText(
                    child: 'Question ${indexAction+1}/$totalQuestions',
                    size: 0.02,
                    fontWeight: FontWeight.w300,
                    color: textColor),
              ],
            ),
          ),
          SizedBox(height: size?.hp(4),),
          CustomeText(
              child: '$question',
              size: 0.025,
              fontWeight: FontWeight.w400,
              color: textColor),
        ],
      ),
    );
  }
}
