

class AnalyticsData {
  final double completionrate;
  final int totalTimeSpent;
  final double averagequizScore;
  final Map<String, double> skillProgress;
  final List<String> recommendations;
  final List<WeeklyProgress> weeklyProgress;
  final Map<String, int> learningStreak;
  final int totalCoursesEnrolled;
  final int certificationdEarned;

  AnalyticsData({
    required this.completionrate,
    required this.totalTimeSpent,
    required this.averagequizScore,
    required this.skillProgress,
    required this.recommendations,
    required this.weeklyProgress,
    required this.learningStreak,
    required this.totalCoursesEnrolled,
    required this.certificationdEarned,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'completionrate': completionrate,
      'totalTimeSpent': totalTimeSpent,
      'averagequizScore': averagequizScore,
      'skillProgress': skillProgress,
      'recommendations': recommendations,
      'weeklyProgress': weeklyProgress,
      'learningStreak': learningStreak,
      'totalCoursesEnrolled': totalCoursesEnrolled,
      'certificationdEarned': certificationdEarned,
    };
  }

  factory AnalyticsData.fromJson(Map<String, dynamic> map) {
    return AnalyticsData(
      completionrate: map['completionrate'] ?? 0.0,
      totalTimeSpent: map['totalTimeSpent'] ?? 0,
      averagequizScore: map['averagequizScore'] ?? 0.0,
      skillProgress: Map<String, double>.from((map['skillProgress'] ?? {})),
      recommendations: List<String>.from((map['recommendations'] ?? [])),
      weeklyProgress: List<WeeklyProgress>.from(
        map['weeklyProgress']?.map<WeeklyProgress>(
          (x) => WeeklyProgress(x['day'], x['minutes']),
        ),
      ),
      learningStreak: Map<String, int>.from((map['learningStreak'] ?? {})),
      totalCoursesEnrolled: map['totalCoursesEnrolled'] ?? 0,
      certificationdEarned: map['certificationdEarned'] ?? 0,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory AnalyticsData.fromJson(String source) => AnalyticsData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeeklyProgress {
  final String day;
  final int minutes;

  WeeklyProgress(this.day, this.minutes);
}
