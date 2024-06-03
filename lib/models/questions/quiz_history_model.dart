class QuizHistory {
  final int numbCorrectAnswer;
  final DateTime time;

  QuizHistory(this.numbCorrectAnswer, this.time);

  Map<String, dynamic> toJson() {
    return {
      'numbCorrectAnswer': numbCorrectAnswer,
      'time': time.toIso8601String(),
    };
  }

  factory QuizHistory.fromJson(Map<String, dynamic> json) {
    return QuizHistory(
      json['numbCorrectAnswer'] as int,
      DateTime.parse(json['time'] as String),
    );
  }
}
