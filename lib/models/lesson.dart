class Lesson {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final int duration;
  final List<Resource> resources;
  final bool isPreview;
  final bool isLocked;
  final bool isCompleted;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.duration,
    required this.resources,
    this.isPreview = false,
    this.isLocked = false,
    this.isCompleted = false,
  });

  Lesson copyWith({
    String? id,
    String? title,
    String? description,
    String? videoUrl,
    int? duration,
    List<Resource>? resources,
    bool? isPreview,
    bool? isLocked,
    bool? isCompleted,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      duration: duration ?? this.duration,
      resources: resources ?? this.resources,
      isPreview: isPreview ?? this.isPreview,
      isLocked: isLocked ?? this.isLocked,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'videoUrl': videoUrl,
      'duration': duration,
      'resources': resources.map((x) => x.toJson()).toList(),
      'isPreview': isPreview,
      'isLocked': isLocked,
      'isCompleted': isCompleted,
    };
  }

  factory Lesson.fromJson(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      videoUrl: map['videoUrl'] as String,
      duration: map['duration'] as int,
      resources: List<Resource>.from(
        (map['resources'] as List<int>).map<Resource>(
          (x) => Resource.fromJson(x as Map<String, dynamic>),
        ),
      ).toList(),
      isPreview: map['isPreview'] ?? false,
      isLocked: map['isLocked'] ?? true,
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Lesson.fromJson(String source) => Lesson.fromMap(json.decode(source) as Map<String, dynamic>);

  String get videoStreamUrl {
    return videoUrl;
  }
}

class Resource {
final String id;
  final String title;
  final String type;
  final String url;

  Resource({required this.id, required this.title, required this.type, required this.url});


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'type': type,
      'url': url,
    };
  }

  factory Resource.fromJson(Map<String, dynamic> map) {
    return Resource(
      id: map['id'] as String,
      title: map['title'] as String,
      type: map['type'] as String,
      url: map['url'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Resource.fromJson(String source) => Resource.fromMap(json.decode(source) as Map<String, dynamic>);
}
