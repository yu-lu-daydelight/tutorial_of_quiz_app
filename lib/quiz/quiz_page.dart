import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial_of_quzie_app/quiz/quiz.dart';
import 'package:tutorial_of_quzie_app/quiz/quiz_data.dart';

var quizzes = Quizzes;

class QuizPage extends StatefulWidget {
  final int currentIndex;
  const QuizPage({super.key, required this.currentIndex});
  @override
  State<QuizPage> createState() => _QuizPageState(required this.currentIndex);
}

class _QuizPageState extends State<QuizPage> {
  final int index;
  _QuizPageState({required this.index}):super(currentIndex: index)

  int get index => currentIndex;

  Quiz get quiz => quizzes[index];
  bool showResult = false;
  String? selectChoice;

  Widget _choiceButton({required String choice}) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectChoice = choice;
          showResult = true;
        });
      },
      child: Text(choice),
    );
  }

  Widget _nextButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          currentIndex += 1;
        });
        _nextQuestion();
      },
      child: Text('次へ'),
    );
  }

  void _nextQuestion() {
    if (index < quizzes.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizPage(currentIndex: index + 1),
        ),
      );
    } else if (index == quizzes.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => resultPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 300,
                        height: 100,
                        padding: const EdgeInsets.all(5.0), // inside spacing
                        decoration: BoxDecoration(
                          color: Colors.white, // background color
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(
                            5,
                          ), // rounded corners
                        ),
                        child: Center(
                          child: Text(
                            quiz.question,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ), // for the question. build in container
                    Expanded(
                      flex: 2,
                      child: (Column(
                        children:
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            quiz.choices
                                .map((c) => _choiceButton(choice: c))
                                .toList(),
                      )),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: selectChoice != null
                            ? _nextButton()
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Center(
                  child: Column(
                    children: [
                      if (showResult == true &&
                          selectChoice == quiz.correctChoice)
                        const Icon(Icons.circle_outlined)
                      else if (showResult == true &&
                          selectChoice != quiz.correctChoice)
                        const Icon(Icons.close),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
