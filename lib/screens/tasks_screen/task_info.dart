class TaskData {
  final double percent;
  final String deadlineDate;
  final List<String> urlImages;

  final String titleTask;
  final String? description, priority, category;
  final int? points;
  final DateTime? startAt, finishedAt;

  TaskData({
    required this.percent,
    required this.titleTask,
    required this.deadlineDate,
    required this.urlImages,
    this.description,
    this.priority,
    this.category,
    this.points,
    this.startAt,
    this.finishedAt,
  });

  factory TaskData.fromMap(Map<String, dynamic> map) {
    return TaskData(
      percent: 0.0,
      deadlineDate: "",
      urlImages: [],
      //
      titleTask: map['titleTask'],
      description: map['description'],
      priority: map['priority'],
      category: map['category'],
      points: map['points'],
      startAt: map['startAt'],
      finishedAt: map['finishedAt'],
    );
  }
}

final List<TaskData> tasks = [
  TaskData(
    percent: 0.8,
    titleTask: 'Lectures Study',
    deadlineDate: '2024-03-15',
    urlImages: [
      'assets/images/Person_1.png',
      'assets/images/Person_2.png',
      'assets/images/Person_3.png'
    ],
  ),
  TaskData(
    percent: 0.5,
    titleTask: 'Quiz Preparation',
    deadlineDate: '2024-03-18',
    urlImages: ['assets/images/Person_4.png'],
  ),
  TaskData(
    percent: 0.3,
    titleTask: 'Quiz Preparation',
    deadlineDate: '2024-03-18',
    urlImages: ['assets/images/Person_4.png', 'assets/images/Person_2.png'],
  ),
];
DateTime today = DateTime.now();

List<DateTime> dates = List.generate(
  11,
  (index) => today.subtract(Duration(days: 5)).add(Duration(days: index)),
);
