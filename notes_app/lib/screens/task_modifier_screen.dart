import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/models/task_model.dart';
import 'package:notes_app/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TaskModifierScreen extends StatelessWidget {
  const TaskModifierScreen({super.key, this.taskModel});

  final TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final TextEditingController titleController =
        TextEditingController(text: taskModel == null ? '' : taskModel?.title);
    final TextEditingController descriptionController = TextEditingController(
        text: taskModel == null ? '' : taskModel?.content);
    return Scaffold(
      appBar: AppBar(
        title: Text(taskModel == null ? 'Crear Tarea' : 'Editar Tarea'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => {
                    taskProvider.createOrUpdateTask(
                      titleController.text,
                      descriptionController.text,
                      isNewTask: taskModel == null,
                      idTask: taskModel?.id,
                    ),
                    Navigator.pop(context)
                  },
              icon: Icon(taskModel == null
                  ? Icons.save_outlined
                  : Icons.update_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              maxLength: 20,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese el titulo (máx. 20 caracteres)',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              maxLength: 100,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLines: 6,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese la descripción (máx. 60 caracteres)',
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xffFDF0EC),
          onPressed: () => {
                taskProvider.createOrUpdateTask(
                  titleController.text,
                  descriptionController.text,
                  isNewTask: taskModel == null,
                  idTask: taskModel?.id,
                ),
                Navigator.pop(context)
              },
          icon: Icon(
              taskModel == null ? Icons.save_outlined : Icons.update_outlined,
              color: const Color(0xff81290E)),
          label: Text(taskModel == null ? 'Guardar Tarea' : 'Actualizar Tarea',
              style: const TextStyle(color: Color(0xff81290E)))),
    );
  }
}
