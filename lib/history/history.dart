class History {
  final String question;
  final String result;
  final String answer;
  final String correctAnswer;
  final String replyDate;
  History({
    required this.question,
    required this.result,
    required this.answer,
    required this.correctAnswer,
    required this.replyDate,
  });
}

class HistoryData {
  List<History> histories = [];
  static final HistoryData _instance = HistoryData._internal();
  factory HistoryData() {
    //_instance.histories = histories;
    return _instance;
  }
  void addHistory(History History) {
    histories.add(History);
  }

  HistoryData._internal();
}
