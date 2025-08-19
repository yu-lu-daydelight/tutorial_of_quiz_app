import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial_of_quzie_app/quiz/quiz.dart';
import 'package:tutorial_of_quzie_app/quiz/quiz_data.dart';
import '../result/result_page.dart';

class QuizPage extends StatefulWidget {
  //final int currentIndex;
  //const QuizPage({super.key, required this.currentIndex});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //final int index;
  //_QuizPageState({required this.index}):super(currentIndex: index)

  //int get index => widget.currentIndex;
  var quizzes = Quizzes;
  var correctCount = 0;
  var currentIndex = 0;
  Quiz get quiz => quizzes[currentIndex];
  bool showResult = false;
  String? selectChoice;

  Widget _choiceButton({required String choice}) {
    return ElevatedButton(
      onPressed: showResult
          ? null
          : () {
              selectChoice = choice;
              setState(() {
                if (selectChoice == quiz.correctChoice) {
                  correctCount += 1;
                }
                showResult = true;
                //selectChoice = null;
              });
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: (selectChoice == choice)
            ? Colors.red.shade400
            : Colors.grey.shade300,
      ),
      child: Text(choice),
    );
  }

  Widget _nextButton() {
    return ElevatedButton(
      onPressed: () {
        _nextQuestion();
      },
      child: Text('次へ'),
    );
  }

  void _nextQuestion() {
    if (currentIndex < quizzes.length - 1) {
      setState(() {
        currentIndex += 1;
        selectChoice = null;
        showResult = false;
      });
    } else if (currentIndex == quizzes.length - 1) {
      //if (selectChoice == quiz.correctChoice) {
      //correctCount += 1;
      //}
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(correctCount: correctCount),
        ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
      ),
    );
  }
}
