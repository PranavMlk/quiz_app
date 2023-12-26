import 'package:flutter/material.dart';
import 'package:quiz_app/model/db_connect.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/responsive.dart';
import 'package:quiz_app/widgets/container/nextButton.dart';
import 'package:quiz_app/widgets/container/optionTile.dart';
import 'package:quiz_app/widgets/text/question_widget.dart';
import 'package:quiz_app/widgets/text/textstyle.dart';

import '../model/question_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Screen ? size;
  int index=0;
  int score=0;
  bool isClicked=false;
  bool isSelected= false;
  var db = DbConnect();
  late Future _questions;
  Future<List<Question>> getData()async{
    return db.fetchQuestions();
  }

  @override
  void initState(){
    _questions=getData();
    super.initState();
  }

  // List<Question> _question=[
  //   Question(
  //       id: '1',
  //       title: 'What is 2+2 ?',
  //       options: {'5':false,'4':true,'1':false,'9':false}),
  //   Question(
  //       id: '1',
  //       title: 'What is 7+2',
  //       options: {'5':false,'4':false,'1':false,'9':true}),
  // ];

  void next(int queLength){
    if(index==queLength-1){
      return;
    }else
      if(isClicked) {
        setState(() {
          index++;
          isClicked = false;
          isSelected=false;
        });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select any option'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 30),
          ),
        );
      }
  }

  void selectAndCheck(bool value){
    if(isSelected){
      return;
    }else {
      if (value == true) {
        score++;
        setState(() {
          isClicked = true;
          isSelected=true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return FutureBuilder(
        future: _questions as Future<List<Question>>,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Center(child: CustomeText( size: 0.02,
                fontWeight: FontWeight.w400,
                color: secondaryColor,
                child:'${snapshot.hasError}',),);
            }else if(snapshot.hasData){
              var extractedData= snapshot.data as List<Question>;
              return Scaffold(
                backgroundColor: primaryColor,
                appBar: AppBar(
                  backgroundColor: primaryColor,
                  elevation: 0,
                  title: CustomeText(child: 'Quiz APP', size: 0.04, fontWeight: FontWeight.w700, color: secondaryColor),
                  actions: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomeText(child: 'Score: $score', size: 0.02, fontWeight: FontWeight.w400, color: secondaryColor),
                    )
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      QuestionWidget(
                          question: extractedData[index].title,
                          indexAction: index,
                          totalQuestions: extractedData.length),
                      SizedBox(height: size?.hp(10),),
                      for(int i =0 ; i< extractedData[index].options.length; i++)
                        GestureDetector(
                          onTap:(){
                            selectAndCheck(extractedData[index].options.values.toList()[i]);
                          },
                          child: OptionTile(option: extractedData[index].options.keys.toList()[i],
                            color:isClicked? extractedData[index].options.values.toList()[i]==true
                                ?rightColor
                                :wrongColor
                                :tileColor,
                          ),
                        )
                    ],
                  ),
                ),
                floatingActionButton: GestureDetector(
                  onTap: ()=>next(extractedData.length),
                    child: NextButton()),
                floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
              );
            }
          }else{
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: secondaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomeText( size: 0.02,
                  fontWeight: FontWeight.w400,
                  color: secondaryColor,
                  child:'Wait little while,Questions are loading...',),
                )
              ],
            ),);
          }
          return Center(child: Text('No Data'),);
        }
        );
  }
}
