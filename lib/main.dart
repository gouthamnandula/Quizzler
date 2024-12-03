import 'package:quizzler/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Quizzler());
QuizBrain quizBrain = QuizBrain();
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  void _resetQuiz(){
    setState(() {
      quizBrain.resetQuiz();
      scoreKeeper.clear();
    });
  }

  void checkAnswer(bool userEnteredAnswer){
    setState(() {
    bool correctAnswer = quizBrain.answer();
      if(userEnteredAnswer == correctAnswer){
        scoreKeeper.add(const Icon(Icons.check,color: Colors.green,));
      }else{
        scoreKeeper.add(const Icon(Icons.close,color: Colors.red,));
      }
      //The user picked false.
      quizBrain.nextQuestion(context,_resetQuiz);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.showMeQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
            },
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
        children: scoreKeeper,
        ),
      ],
    );

  }
}


