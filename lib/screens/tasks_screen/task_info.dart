class TaskData {
  final String id;
  final String name;
  final String description;
  final String priority;
  final String category;
  final int points;
  final String deadline;
  final String createdAt;
  final String startedAt;
  final String finishedAt;
  final List<dynamic> subtasks;
  final List<String> userId;
  final int v;

  TaskData({
    required this.id,
    required this.name,
    required this.description,
    required this.priority,
    required this.category,
    required this.points,
    required this.deadline,
    required this.createdAt,
    required this.startedAt,
    required this.finishedAt,
    required this.subtasks,
    required this.userId,
    required this.v,
  });
  factory TaskData.fromJson(Map<String, dynamic> json) {
    return TaskData(
      id: json['_id'],
      name: json['name'],
      description: json['description'] ?? "",
      priority: json['priority'] ?? -1,
      category: json['category'] ?? "",
      points: json['points'] ?? -1,
      deadline: json['deadline'] ?? "",
      createdAt: json['createdAt'] ?? "",
      startedAt: json['startedAt'] ?? "",
      finishedAt: json['finishedAt'] ?? "",
      subtasks: json['subtasks'] ?? [],
      userId: json['userId'] ?? [],
      v: json['__v'],
    );
  }
}

DateTime today = DateTime.now();

List<DateTime> dates = List.generate(
  1,
  (index) => today.subtract(Duration(days: 5)).add(Duration(days: index)),
);
