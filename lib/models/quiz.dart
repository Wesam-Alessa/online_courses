
import 'package:online_courses/models/question.dart';

class Quiz {
  final String id;
  final String title;
  final String description;
  final int timeLimit;
  final List<Question> questions;
  final DateTime createdAt;
  final bool isActive;

  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.timeLimit,
    required this.questions,
    required this.createdAt,
    this.isActive = true,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'timeLimit': timeLimit,
      'quastions': questions.map((x) => x.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };
  }

  factory Quiz.froJson(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'] ??'',
      title: map['title']??'',
      description: map['description'] ??'',
      timeLimit: map['timeLimit'] ?? 30,
      questions: List<Question>.from(
        (map['quastions'] as List<dynamic>).map<Question>(
          (x) => Question.fromJson(x as Map<String, dynamic>),
        ),
      ),
      createdAt: DateTime.parse(map['createdAt']),
      isActive: map['isActive'] ?? true,
    );
  }

//   String toJson() => json.encode(toMap());

//   factory Quiz.fromJson(String source) =>
//       Quiz.fromMap(json.decode(source) as Map<String, dynamic>);
 }



