
class Question {
  final String id;
  final String text;
  final String correctOptionId;
  final int points;
  final List<Option> options;

  Question({
    required this.id,
    required this.text,
    required this.correctOptionId,
    this.points = 1,
    required this.options,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'correctOptionId': correctOptionId,
      'points': points,
      'options': options.map((x) => x.toJson()).toList(),
    };
  }

  factory Question.fromJson(Map<String, dynamic> map) {
    return Question(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      correctOptionId: map['correctOptionId'] ?? '',
      points: map['points'] ?? 1,
      options: List<Option>.from(
        (map['options'] as List<int>).map<Option>(
          (x) => Option.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Option {
  final String id;
  final String text;

  Option({required this.id, required this.text});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'text': text};
  }

  factory Option.fromJson(Map<String, dynamic> map) {
    return Option(id: map['id'] ?? '', text: map['text'] ?? '');
  }

  // String toJson() => json.encode(toMap());

  // factory Option.fromJson(String source) => Option.fromMap(json.decode(source) as Map<String, dynamic>);
}
