import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final choices = ["a", "b", "c", "d"];
  final correctChoice = "a";
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
                          child: const Text(
                            'What is the capital of France?',
                            style: TextStyle(
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
                            choices
                                .map((c) => _choiceButton(choice: c))
                                .toList(),
                      )),
                    ),
                  ],
                ),
              ),

              Center(
                child: Center(
                  child: Column(
                    children: [
                      if (showResult == true && selectChoice == correctChoice)
                        const Icon(Icons.circle_outlined)
                      else if (showResult == true &&
                          selectChoice != correctChoice)
                        const Icon(Icons.close),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), //choices.map((choice) => _choiceButton(choice: choice)).toList()
    );
  }
}
