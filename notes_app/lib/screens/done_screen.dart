import 'package:flutter/material.dart';
import 'package:notes_app/models/status_enum.dart';
import 'package:notes_app/provider/task_provider.dart';
import 'package:notes_app/widget/widgets.dart';
import 'package:provider/provider.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      var tasks = taskProvider.filteredTaskByStatus(Status.done);
      return Expanded(
          child: Container(
        color: const Color(0xffFAD0C6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TaskCard(
                            taskModel: tasks[index],
                            borderColor: const Color(0xffF6A08D)),
                        const SizedBox(height: 12)
                      ],
                    );
                  }),
            ),
          ]),
        ),
      ));
    });
  }
}
