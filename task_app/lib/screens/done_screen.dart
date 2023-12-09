import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/device_type.dart';
import 'package:task_app/models/status_enum.dart';
import 'package:task_app/providers/task_provider.dart';
import 'package:task_app/utils/adaptative.dart';
import 'package:task_app/widgets/adaptative_task.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(context);

    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      var tasks = taskProvider.filteredTaskByStatus(Status.done);

      return Container(
        decoration: BoxDecoration(
          color: const Color(0xfffad0c6),
          border: Border.all(color: const Color(0xfff6a08d), width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AdaptativeTask(
              tasks: tasks,
              borderColor: const Color(0xfff6a08d),
              isTablet: deviceType == DeviceType.Tablet),
        ),
      );
    });
  }
}
