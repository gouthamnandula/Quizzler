import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

import 'questions.dart';
class QuizBrain {
    int _questionNum = 0;
    final List<Question> _questionBank= [
      Question('Some cats are actually allergic to humans', true),
      Question('You can lead a cow down stairs but not up stairs.', false),
      Question('Approximately one quarter of human bones are in the feet.', true),
      Question('A slug\'s blood is green.', true),
      Question('Buzz Aldrin\'s mother\'s maiden name was Moon.', true),
      Question('It is illegal to pee in the Ocean in Portugal.', true),
      // Question('No piece of square dry paper can be folded in half more than 7 times.', false),
      // Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
      // Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
      // Question('The total surface area of two human lungs is approximately 70 square metres.', true),
      // Question('Google was originally called \"Back rub\".', true),
      // Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
      // Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
      // Question('The Great Wall of China is visible from space.', false),
      // Question('Bananas are berries, but strawberries are not.', true),
      // Question('The Eiffel Tower can be 15 cm taller during the summer.', true),
      // Question('Humans share 50% of their DNA with bananas.', true),
      // Question('Goldfish only have a memory span of three seconds.', false),
      // Question('There are more stars in the universe than grains of sand on all the world’s beaches.', true),
      // Question('A group of flamingos is called a "flamboyance".', true),
      // Question('The capital of Australia is Sydney.', false),
      // Question('Venus is the hottest planet in our solar system.', true),
      // Question('The shortest war in history lasted 38 minutes.', true),
      // Question('Bees can recognize human faces.', true),
      // Question('The unicorn is the national animal of Scotland.', true),
      // Question('Lightning never strikes the same place twice.', false),
      // Question('Humans and dinosaurs lived at the same time.', false),
    ];
    String showMeQuestion(){
      return _questionBank[_questionNum].questionsText;
    }
    bool answer (){
      return _questionBank[_questionNum].questionAnswers;
    }
    void nextQuestion(BuildContext context,VoidCallback onReset) {                                                            //its called a method
      if (_questionNum <_questionBank.length-1) {
        _questionNum++;
      }else{
        _showCompletionAlert(context,onReset);
      }
    }
    void _showCompletionAlert(BuildContext context,VoidCallback onReset) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Completed",
        desc: "Press retry button if you want to retry the Quiz",
        buttons: [
          DialogButton(
            width: 120,
            child:const Text(
              "RETRY",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              onReset();
            },
          )
        ],
      ).show();
    }
    void resetQuiz(){
      _questionNum = 0;
    }
}


