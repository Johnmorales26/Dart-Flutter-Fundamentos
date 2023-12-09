import 'package:task_app/models/status_enum.dart';

class TaskModel {
  int id;
  String title;
  String description;
  Status status;

  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.status});
}
