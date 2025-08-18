import 'package:flutter/material.dart';
import '../quiz/quiz_page.dart';

class ResultPage extends StatelessWidget {
  final int correctCount;
  const ResultPage({super.key, required this.correctCount});
  String get textToShow => correctCount.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(textToShow),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(onPressed: () {}, child: Text("リトライ")),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(onPressed: () {}, child: Text("タイトル")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
