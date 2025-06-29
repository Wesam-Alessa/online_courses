

class QuizAttempt {
  final String id;
  final String quizId;
  final String userId;
  final Map<String, String> answers;
  final int score;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int timeSpent;

  QuizAttempt({
    required this.id,
    required this.quizId,
    required this.userId,
    required this.answers,
    required this.score,
    required this.startedAt,
    this.completedAt,
    required this.timeSpent,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'quizId': quizId,
      'userId': userId,
      'answers': answers,
      'score': score,
      'startedAt': startedAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'timeSpent': timeSpent,
    };
  }

  factory QuizAttempt.fromJson(Map<String, dynamic> map) {
    return QuizAttempt(
      id: map['id'] ?? '',
      quizId: map['quizId'] ?? '',
      userId: map['userId'] ?? '',
      answers: Map<String, String>.from((map['answers'] ?? {})),
      score: map['score'] ?? 0,
      startedAt: DateTime.parse(map['startedAt']),
      completedAt:
          map['completedAt'] != null
              ? DateTime.parse(map['completedAt'])
              : null,
      timeSpent: map['timeSpent'] ??0,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory QuizAttempt.fromJson(String source) =>
  //     QuizAttempt.fromMap(json.decode(source) as Map<String, dynamic>);
}
