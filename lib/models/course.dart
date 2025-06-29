import 'package:online_courses/models/lesson.dart';

class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String instructorId;
  final String categoryId;
  final double price;
  final List<Lesson> lessons;
  final double rating;
  final int reviewCount;
  final int enrollmentCount;
  final String level;
  final List<String> requirments;
  final List<String> whatYouWillLearn;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPremium;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.instructorId,
    required this.categoryId,
    required this.price,
    required this.lessons,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.enrollmentCount = 0,
    required this.level,
    required this.requirments,
    required this.whatYouWillLearn,
    required this.createdAt,
    required this.updatedAt,
    this.isPremium = false,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'instructorId': instructorId,
      'categoryId': categoryId,
      'price': price,
      'lessons': lessons.map((x)=>x.toJson()).toList(),
      'rating': rating,
      'reviewCount': reviewCount,
      'enrollmentCount': enrollmentCount,
      'level': level,
      'requirments': requirments,
      'whatYouWillLearn': whatYouWillLearn,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isPremium': isPremium,
    };
  }

  factory Course.fromJson(Map<String, dynamic> map) {
    return Course(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      instructorId: map['instructorId'] as String,
      categoryId: map['categoryId'] as String,
      price: map['price'] as double,
      lessons: 
      List<Lesson>.from((map['lessons'] as List<int>).map<Lesson>((x) => Lesson.fromJson(x as Map<String,dynamic>),),).toList(),
      rating: map['rating']?.toDouble() ?? 0.0,
      reviewCount: map['reviewCount'] ?? 0,
      enrollmentCount: map['enrollmentCount'] as int,
      level: map['level'] as String,
      requirments: List<String>.from((map['requirments'] as List<String>)),
      whatYouWillLearn: List<String>.from(map['whatYouWillLearn'] as List<String>),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      isPremium: map['isPremium'] ?? false,
    );
  }

  //String toJson() => json.encode(toMap());

  //factory Course.fromJson(String source) => Course.fromMap(json.decode(source) as Map<String, dynamic>);
}
