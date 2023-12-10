import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/device_type.dart';
import 'package:task_app/models/status_enum.dart';
import 'package:task_app/providers/task_provider.dart';
import 'package:task_app/utils/adaptative.dart';
import 'package:task_app/widgets/adaptative_task.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(context);
    //  Utiliza el widget Consumer para escuchar cambios en el TaskProvider
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      var tasks = taskProvider.filteredTaskByStatus(Status.todo);
      return Container(
        decoration: BoxDecoration(
            color: const Color(0xffcad9f6),
            border: Border.all(color: const Color(0xff96b3ee), width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: AdaptativeTask(
              tasks: tasks,
              borderColor: const Color(0xff96b3ee),
              isTablet: deviceType == DeviceType.tablet,
            )),
      );
    });
  }
}
