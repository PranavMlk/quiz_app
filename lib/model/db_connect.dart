import 'package:http/http.dart' as http;
import 'package:quiz_app/model/question_model.dart';
import 'dart:convert';

class DbConnect{

  final url= Uri.parse('https://quiz-3255c-default-rtdb.firebaseio.com/questions.json');

  Future<List<Question>> fetchQuestions()async{
    return http.get(url).then((response){
      var data= json.decode(response.body)as Map<String,dynamic>;
      List<Question> newQuestions=[];
      data.forEach((key, value) {
        var newQuestion=Question(
            id: key,
            title: value['title'],
            options: Map.castFrom(value['options']));
        newQuestions.add(newQuestion);
      });
      return newQuestions;
      print(newQuestions);
    });
  }
}