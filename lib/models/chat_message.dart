
class ChatMessage {
  final String id;
  final String senderId;
  final String receiverId;
  final String courseId;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.courseId,
    required this.message,
    required this.timestamp,
      this.isRead = false,
      
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'courseId': courseId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'] as String,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      courseId: map['courseId'] as String,
      message: map['message'] as String,
      timestamp: DateTime.parse(map['timestamp']),
      isRead: map['isRead']?? false,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ChatMessage.fromJson(String source) => ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);
}
