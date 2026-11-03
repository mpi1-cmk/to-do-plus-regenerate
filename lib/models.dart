class Task {
  final String id;
  String title;
  bool isCompleted;
  String? alarmTime;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.alarmTime,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isCompleted': isCompleted,
        'alarmTime': alarmTime,
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        isCompleted: json['isCompleted'] ?? false,
        alarmTime: json['alarmTime'],
      );
}
