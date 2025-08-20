import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'history.dart';

class HistoryPage extends StatelessWidget {
  final List<History> listToShow;
  const HistoryPage({super.key, required this.listToShow});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: Center(
        child: ListView(
          children: listToShow.map((e) => _historyTile(e)).toList(),
        ),
      ),
    );
  }
}

Widget _historyTile(History h) {
  return ListTile(
    title: Text("問題文:${h.question}"),
    leading: Text(h.result == "正解" ? "✔" : "✖"),
    subtitle: Text(
      " あなたの答え：${h.answer} 正解：${h.correctAnswer} 日付：${h.replyDate}",
    ),
  );
}
