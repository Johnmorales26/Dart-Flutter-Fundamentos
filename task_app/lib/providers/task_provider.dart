import 'package:flutter/material.dart';
import 'package:task_app/database/task_database_helper.dart';
import 'package:task_app/models/status_enum.dart';
import 'package:task_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  Future<List<TaskModel>?>? readTaskByStatus(Status status) {
    var response = TaskDatabaseHelper.db.readRaw(status.name);
    try {
      print('La respuesta no fue null');
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void createOrUpdateTask(
      {required String title,
      required String description,
      required bool isNewTask,
      int? idTask}) async {
    if (isNewTask) {
      //  Creando un nuevo elemento en la lista
      TaskModel taskModel = TaskModel(
          id: DateTime.now().microsecondsSinceEpoch,
          title: title,
          description: description,
          status: Status.todo.name);
      //  Agregando nuevo task a la lista
      TaskDatabaseHelper.db.createRaw(taskModel);
    } else {
      //  Actualizando un elemento en la lista
      TaskModel? taskToUpdate;
      try {
        taskToUpdate = await TaskDatabaseHelper.db.readById(idTask!);
        if (taskToUpdate != null) {
          taskToUpdate.title = title;
          taskToUpdate.description = description;
          TaskDatabaseHelper.db.updateRaw(taskToUpdate);
          print('Se actualizo correstamente');
        }
      } catch (e) {
        //  No se encontro ninguna tarea con el ID
        //  ignore: avoid_print
        print('No se encontró ninguna tarea con el ID: $idTask');
      }
    }
    notifyListeners();
  }

  void deleteTaskById(int taskId) async {
    //  Lógica para eliminar un elemento de la lista
    try {
      TaskDatabaseHelper.db.deleteRaw(taskId);
    } catch (e) {
      print('No se encontró ninguna tarea con el ID: $taskId');
    }
    //  Notificamos a los listeners que la lista cambio
    notifyListeners();
  }

  void updateTaskById(int idTask) async {
    //  Acceder y actualizar una tarea especifica por su ID
    try {
      TaskModel? taskToUpdate = await TaskDatabaseHelper.db.readById(idTask);
      if (taskToUpdate != null) {
        taskToUpdate.status = taskToUpdate.status == Status.todo.name
            ? Status.inProgress.name
            : Status.done.name;
        TaskDatabaseHelper.db.updateRaw(taskToUpdate);
      }
    } catch (e) {
      print('No se encontró ninguna tarea con el ID: $idTask');
    }
    notifyListeners();
  }
}
