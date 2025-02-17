import 'package:task_manger/screens/add_task_screen/models/user.dart';

class Task {
  final String category;
  final String title;
  final DateTime date;
  final List<User> users;

  Task(
      {required this.category,
      required this.title,
      required this.date,
      required this.users});
}
