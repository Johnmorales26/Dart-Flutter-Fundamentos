import 'package:flutter/material.dart';
import 'package:task_app/models/status_enum.dart';
import 'package:task_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _tasks = [
    TaskModel(
        id: 1,
        title: 'Tarea 1',
        description: 'Contenido de la tarea 1',
        status: Status.todo),
    TaskModel(
        id: 2,
        title: 'Tarea 2',
        description: 'Contenido de la tarea 2',
        status: Status.inProgress),
    TaskModel(
        id: 3,
        title: 'Tarea 3',
        description: 'Contenido de la tarea 3',
        status: Status.done),
    TaskModel(
        id: 4,
        title: 'Tarea 4',
        description: 'Contenido de la tarea 4',
        status: Status.todo),
    TaskModel(
        id: 5,
        title: 'Tarea 5',
        description: 'Contenido de la tarea 5',
        status: Status.inProgress),
    TaskModel(
        id: 6,
        title: 'Tarea 6',
        description: 'Contenido de la tarea 6',
        status: Status.done),
    TaskModel(
        id: 7,
        title: 'Tarea 7',
        description: 'Contenido de la tarea 7',
        status: Status.todo),
    TaskModel(
        id: 8,
        title: 'Tarea 8',
        description: 'Contenido de la tarea 8',
        status: Status.inProgress),
    TaskModel(
        id: 9,
        title: 'Tarea 9',
        description: 'Contenido de la tarea 9',
        status: Status.done),
    TaskModel(
        id: 10,
        title: 'Tarea 10',
        description: 'Contenido de la tarea 10',
        status: Status.todo),
    TaskModel(
        id: 11,
        title: 'Tarea 11',
        description: 'Contenido de la tarea 11',
        status: Status.inProgress),
    TaskModel(
        id: 12,
        title: 'Tarea 12',
        description: 'Contenido de la tarea 12',
        status: Status.done),
    TaskModel(
        id: 13,
        title: 'Tarea 13',
        description: 'Contenido de la tarea 13',
        status: Status.todo),
    TaskModel(
        id: 14,
        title: 'Tarea 14',
        description: 'Contenido de la tarea 14',
        status: Status.inProgress),
    TaskModel(
        id: 15,
        title: 'Tarea 15',
        description: 'Contenido de la tarea 15',
        status: Status.done),
    TaskModel(
        id: 16,
        title: 'Tarea 16',
        description: 'Contenido de la tarea 16',
        status: Status.todo),
    TaskModel(
        id: 17,
        title: 'Tarea 17',
        description: 'Contenido de la tarea 17',
        status: Status.inProgress),
    TaskModel(
        id: 18,
        title: 'Tarea 18',
        description: 'Contenido de la tarea 18',
        status: Status.done),
    TaskModel(
        id: 19,
        title: 'Tarea 19',
        description: 'Contenido de la tarea 19',
        status: Status.todo),
    TaskModel(
        id: 20,
        title: 'Tarea 20',
        description: 'Contenido de la tarea 20',
        status: Status.inProgress),
  ];

  List<TaskModel> filteredTaskByStatus(Status filter) {
    return _tasks.where((task) => task.status == filter).toList();
  }

  void createOrUpdateTask(
      {required String title,
      required String description,
      required bool isNewTask,
      int? idTask}) {
    if (isNewTask) {
      //  Creando un nuevo elemento en la lista
      TaskModel taskModel = TaskModel(
          id: DateTime.now().microsecondsSinceEpoch,
          title: title,
          description: description,
          status: Status.todo);
      //  Agregando nuevo task a la lista
      _tasks.add(taskModel);
    } else {
      //  Actualizando un elemento en la lista
      TaskModel? taskToUpdate;
      try {
        taskToUpdate = _tasks.firstWhere((task) => task.id == idTask);
      } catch (e) {
        //  No se encontro ninguna tarea con el ID
        //  ignore: avoid_print
        print('No se encontró ninguna tarea con el ID: $idTask');
      }
      if (taskToUpdate != null) {
        taskToUpdate.title = title;
        taskToUpdate.description = description;
      }
    }
    notifyListeners();
  }

  void deleteTaskById(int taskId) {
    //  Lógica para eliminar un elemento de la lista
    _tasks.removeWhere((task) => task.id == taskId);
    //  Notificamos a los listeners que la lista cambio
    notifyListeners();
  }

  void updateTaskById(int id) {
    //  Acceder y actualizar una tarea especifica por su ID
    TaskModel taskToUpdate = _tasks.firstWhere((task) => task.id == id,
        orElse: () =>
            TaskModel(id: -1, title: '', description: '', status: Status.todo));
    if (taskToUpdate.id != -1) {
      taskToUpdate.status =
          taskToUpdate.status == Status.todo ? Status.inProgress : Status.done;
    } else {
      //  ignore: avoid_print
      print('No se encontro ninguna tarea con el ID: $id');
    }
    notifyListeners();
  }
}
