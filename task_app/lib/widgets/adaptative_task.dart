import 'package:flutter/material.dart';
import 'package:task_app/models/task_model.dart';
import 'package:task_app/widgets/task_card.dart';

class AdaptativeTask extends StatelessWidget {
  final List<TaskModel> tasks;
  final Color borderColor;
  final bool isTablet;

  const AdaptativeTask(
      {super.key,
      required this.tasks,
      required this.borderColor,
      required this.isTablet});

  @override
  Widget build(BuildContext context) {
    if (isTablet) {
      //  Contenido para la tablet
      return GridView.builder(
          itemCount: tasks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          itemBuilder: (BuildContext context, int index) {
            return TaskCard(taskModel: tasks[index], borderColor: borderColor);
          });
    } else {
      //  Contenido para la smartphone, largeScreen, extraLargeScreen
      return Column(children: [
        Expanded(
            child: ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return TaskCard(
                      taskModel: tasks[index], borderColor: borderColor);
                }))
      ]);
    }
  }
}
