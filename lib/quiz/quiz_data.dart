import 'package:tutorial_of_quzie_app/quiz/quiz.dart';

final firQues = Quiz(
  question: "日本の首都は？",
  choices: ["東京", "大阪", "札幌", "京都"],
  correctChoice: "東京",
);
final secQues = Quiz(
  question: "sin(π/2)の値は？",
  choices: ["0", "1", "-1", "1/2"],
  correctChoice: "1",
);
final thirQues = Quiz(
  question: "z/(z-1)=1+iであれば、z＝？",
  choices: ["-1-i", "-1+i", "1-i", "i+1"],
  correctChoice: "1-i",
);
final fourQues = Quiz(
  question: "cos(a+b)=m,tan(a)tan(b)=2であれば、cos(a-b)=？",
  choices: ["-3m", "-m/3", "m/3", "3m"],
  correctChoice: "-3m",
);
final fivQues = Quiz(
  question: "cos(π)の値は？？",
  choices: ["-1", "0", "1/2", "1"],
  correctChoice: "-1",
);
final sixQes = Quiz(
  question: "この下のどの開店寿司で抽選会がありますか？",
  choices: ["くら寿司", "はま寿司", "スシロー", "かっぱ寿司"],
  correctChoice: "くら寿司",
);
final sevQues = Quiz(
  question: "寿司は何をつけて食べますか？",
  choices: ["砂糖", "ジュース", " 空気", "醤油"],
  correctChoice: "醤油",
);

final eigQues = Quiz(
  question: "クレヨン新ちゃんがどこに住んでいますか？",
  choices: ["東京都", "埼玉県", "秋田県", "広島県"],
  correctChoice: "埼玉県",
);
final ninQues = Quiz(
  question: "柴犬が可愛ですか？",
  choices: ["いいえ", "柴犬って何", "とてもかわい", "かわい"],
  correctChoice: "とてもかわい",
);
final tenQues = Quiz(
  question: "江戸時代で日本の首都は？",
  choices: ["東京", "大阪", "札幌", "京都"],
  correctChoice: "京都",
);

final Quizzes = [
  firQues,
  secQues,
  thirQues,
  fourQues,
  fivQues,
  sixQes,
  sevQues,
  eigQues,
  ninQues,
  tenQues,
];
