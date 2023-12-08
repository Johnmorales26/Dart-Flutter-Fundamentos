import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/models/status_enum.dart';
import 'package:notes_app/models/task_model.dart';
import 'package:notes_app/utils/utils.dart';

class TaskProvider extends ChangeNotifier {
  Color color = const Color(0xff618DE5);
  List<TaskModel> _tasks = [
    TaskModel(
        id: 1,
        title: 'Tarea 1',
        content: 'Contenido de la tarea 1',
        status: Status.todo),
    TaskModel(
        id: 2,
        title: 'Tarea 2',
        content: 'Contenido de la tarea 2',
        status: Status.inProgress),
    TaskModel(
        id: 3,
        title: 'Tarea 3',
        content: 'Contenido de la tarea 3',
        status: Status.done),
    TaskModel(
        id: 4,
        title: 'Tarea 4',
        content: 'Contenido de la tarea 4',
        status: Status.todo),
    TaskModel(
        id: 5,
        title: 'Tarea 5',
        content: 'Contenido de la tarea 5',
        status: Status.inProgress),
    TaskModel(
        id: 6,
        title: 'Tarea 6',
        content: 'Contenido de la tarea 6',
        status: Status.done),
    TaskModel(
        id: 7,
        title: 'Tarea 7',
        content: 'Contenido de la tarea 7',
        status: Status.todo),
    TaskModel(
        id: 8,
        title: 'Tarea 8',
        content: 'Contenido de la tarea 8',
        status: Status.inProgress),
    TaskModel(
        id: 9,
        title: 'Tarea 9',
        content: 'Contenido de la tarea 9',
        status: Status.done),
    TaskModel(
        id: 10,
        title: 'Tarea 10',
        content: 'Contenido de la tarea 10',
        status: Status.todo),
    TaskModel(
        id: 11,
        title: 'Tarea 11',
        content: 'Contenido de la tarea 11',
        status: Status.inProgress),
    TaskModel(
        id: 12,
        title: 'Tarea 12',
        content: 'Contenido de la tarea 12',
        status: Status.done),
    TaskModel(
        id: 13,
        title: 'Tarea 13',
        content: 'Contenido de la tarea 13',
        status: Status.todo),
    TaskModel(
        id: 14,
        title: 'Tarea 14',
        content: 'Contenido de la tarea 14',
        status: Status.inProgress),
    TaskModel(
        id: 15,
        title: 'Tarea 15',
        content: 'Contenido de la tarea 15',
        status: Status.done),
    TaskModel(
        id: 16,
        title: 'Tarea 16',
        content: 'Contenido de la tarea 16',
        status: Status.todo),
    TaskModel(
        id: 17,
        title: 'Tarea 17',
        content: 'Contenido de la tarea 17',
        status: Status.inProgress),
    TaskModel(
        id: 18,
        title: 'Tarea 18',
        content: 'Contenido de la tarea 18',
        status: Status.done),
    TaskModel(
        id: 19,
        title: 'Tarea 19',
        content: 'Contenido de la tarea 19',
        status: Status.todo),
    TaskModel(
        id: 20,
        title: 'Tarea 20',
        content: 'Contenido de la tarea 20',
        status: Status.inProgress),
  ];

  List<TaskModel> filteredTaskByStatus(Status filter) {
    return _tasks.where((task) => task.status == filter).toList();
  }

  void updateColorByFab(BuildContext context, int index) {
    color = getColorByIndexTab(context, index);
    notifyListeners();
  }

  void deleteTaskById(int taskId) {
    // Lógica para eliminar el elemento de la lista
    _tasks.removeWhere((task) => task.id == taskId);
    // Notificar a los escuchadores que la lista ha cambiado
    notifyListeners();
  }

  void updateTaskById(int id) {
    // Acceder y actualizar una tarea específica por su ID
    TaskModel taskToUpdate = _tasks.firstWhere((task) => task.id == id,
        orElse: () =>
            TaskModel(id: -1, title: '', content: '', status: Status.todo));

    if (taskToUpdate.id != -1) {
      taskToUpdate.status =
          taskToUpdate.status == Status.todo ? Status.inProgress : Status.done;
    } else {
      // ignore: avoid_print
      print('No se encontró ninguna tarea con el ID: $id');
    }
    notifyListeners();
  }

  void createOrUpdateTask(String title, String description,
      {bool isNewTask = true, int? idTask}) {
    if (isNewTask) {
      // Creando un nuevo elemento
      TaskModel taskModel = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        content: description,
        status: Status.todo,
      );
      _tasks.add(taskModel);
    } else {
      // Actualizando un elemento de la lista
      // Acceder y actualizar una tarea específica por su ID
      TaskModel? taskToUpdate;
      try {
        taskToUpdate = _tasks.firstWhere((task) => task.id == idTask);
      } catch (e) {
        // No se encontró ninguna tarea con el ID
        // ignore: avoid_print
        print('No se encontró ninguna tarea con el ID: $idTask');
      }
      if (taskToUpdate != null) {
        taskToUpdate.title = title;
        taskToUpdate.content = description;
      }
    }
    notifyListeners();
  }
}
