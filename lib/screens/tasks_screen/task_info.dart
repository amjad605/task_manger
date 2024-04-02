
class TaskData {
  final double percent;
  final String titleTask;
  final String deadlineDate;
  final List<String> urlImages;

  TaskData({
    required this.percent,
    required this.titleTask,
    required this.deadlineDate,
    required this.urlImages,
  });
}

  final List<TaskData> tasks = [
    TaskData(
      percent: 0.8,
      titleTask: 'Lectures Study',
      deadlineDate: '2024-03-15',
      urlImages: ['assets/images/Person_1.png', 'assets/images/Person_2.png', 'assets/images/Person_3.png'],
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