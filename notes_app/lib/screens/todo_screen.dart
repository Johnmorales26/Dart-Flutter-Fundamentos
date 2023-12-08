import 'package:flutter/material.dart';
import 'package:notes_app/models/status_enum.dart';
import 'package:notes_app/provider/task_provider.dart';
import 'package:notes_app/widget/task_card.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Utiliza el widget Consumer para escuchar cambios en TaskProvider
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, _) {
        var tasks = taskProvider.filteredTaskByStatus(Status.todo);
        return Container(
          color: const Color(0xffCAD9F6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TaskCard(
                            taskModel: tasks[index],
                            borderColor: const Color(0xff96B3EE),
                          ),
                          const SizedBox(height: 12),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
