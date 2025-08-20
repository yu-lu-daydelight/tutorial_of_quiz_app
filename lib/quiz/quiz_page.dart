import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial_of_quzie_app/quiz/quiz.dart';
import 'package:tutorial_of_quzie_app/quiz/quiz_data.dart';
import '../history/history.dart';
import '../result/result_page.dart';

HistoryData trackData = HistoryData();

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
  late final List<Quiz> quizzes;
  var correctCount = 0;
  var currentIndex = 0;
  late String R;
  late DateTime currTime;
  Quiz get quiz => quizzes[currentIndex];
  //List<String> get randomChoices => quiz.choices;
  bool showResult = false;
  String? selectChoice;

  Widget _choiceButton({required String choice}) {
    return ElevatedButton(
      onPressed: () {
        if (showResult) {
          return;
        }
        selectChoice = choice;
        currTime = DateTime.now();
        setState(() {
          if (selectChoice == quiz.correctChoice) {
            correctCount += 1;
            R = "正解";
          } else {
            R = "不正解";
          }
          showResult = true;
        });
        var hisRecord = History(
          question: quiz.question,
          result: R,
          answer: choice,
          correctAnswer: quiz.correctChoice,
          replyDate: currTime.toString(),
        );
        trackData.addHistory(hisRecord);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: (selectChoice == choice)
            ? Colors.red.shade300
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(correctCount: correctCount),
        ),
      );
    }
  }

  List<Quiz> setupQuizzes(List<Quiz> quizzes) {
    quizzes.shuffle();
    return quizzes.map((quiz) {
      return quiz..choices.shuffle();
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    quizzes = setupQuizzes(Quizzes);
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
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(5),
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
                      const ImageIcon(
                        AssetImage('assets/images/jjdEzQvg.png'),
                        size: 30,
                      )
                    else if (showResult == true &&
                        selectChoice != quiz.correctChoice)
                      const ImageIcon(
                        AssetImage('assets/images/3imvJk3g.png'),
                        size: 30,
                      ),
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
