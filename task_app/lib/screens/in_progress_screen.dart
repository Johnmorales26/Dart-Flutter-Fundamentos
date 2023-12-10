import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/device_type.dart';
import 'package:task_app/models/status_enum.dart';
import 'package:task_app/models/task_model.dart';
import 'package:task_app/providers/task_provider.dart';
import 'package:task_app/utils/adaptative.dart';
import 'package:task_app/widgets/adaptative_task.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(context);
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      return FutureBuilder<List<TaskModel>?>(
        future: taskProvider.readTaskByStatus(Status.inProgress),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se espera la respuesta
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si hay un problema
            return Text('Error: ${snapshot.error}');
          } else {
            // Si la operación fue exitosa, utiliza los datos en tu widget
            var tasks = snapshot.data ?? [];
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xffffe4c2),
                border: Border.all(color: const Color(0xffffca85), width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: AdaptativeTask(
                  tasks: tasks,
                  borderColor: const Color(0xffffca85),
                  isTablet: deviceType == DeviceType.tablet,
                ),
              ),
            );
          }
        },
      );
    });
  }
}
