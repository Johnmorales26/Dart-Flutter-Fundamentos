import 'package:notes_app/models/status_enum.dart';

class TaskModel {
  int id;
  String title;
  String content;
  Status status;

  TaskModel({ required this.id, required this.title, required this.content, required this.status});
}
