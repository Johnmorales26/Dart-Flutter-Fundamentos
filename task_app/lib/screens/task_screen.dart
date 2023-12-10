import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/task_model.dart';
import 'package:task_app/providers/task_provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, this.taskModel});

  final TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final TextEditingController titleController =
        TextEditingController(text: taskModel == null ? '' : taskModel?.title);
    final TextEditingController descriptionController = TextEditingController(
        text: taskModel == null ? '' : taskModel?.description);
    return Scaffold(
      appBar: AppBar(
        title: Text(taskModel == null ? 'Crear tarea' : 'Editar tarea',
            style: GoogleFonts.poppins()),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                taskProvider.createOrUpdateTask(
                    title: titleController.text,
                    description: descriptionController.text,
                    isNewTask: taskModel == null,
                    idTask: taskModel?.id);
                Navigator.pop(context);
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
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text('Ingrese el titutlo (máx. 20 caracteres)',
                        style: GoogleFonts.poppins())),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                maxLength: 100,
                maxLines: 6,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text('Ingrese la descripción (máx. 60 caracteres)',
                        style: GoogleFonts.poppins())),
              ),
              const SizedBox(height: 12)
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xfffdf0ec),
          onPressed: () {
            taskProvider.createOrUpdateTask(
                title: titleController.text,
                description: descriptionController.text,
                isNewTask: taskModel == null,
                idTask: taskModel?.id);
            Navigator.pop(context);
          },
          icon: Icon(
              taskModel == null ? Icons.save_outlined : Icons.update_outlined,
              color: const Color(0xff81290e)),
          label: Text(taskModel == null ? 'Guardar tarea' : 'Actualizar tarea',
              style: GoogleFonts.poppins(color: const Color(0xff81290e)))),
    );
  }
}
