import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('スタート')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: Text('結果一覧')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
