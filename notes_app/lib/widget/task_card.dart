import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/models/status_enum.dart';
import 'package:notes_app/models/task_model.dart';
import 'package:notes_app/provider/task_provider.dart';
import 'package:notes_app/screens/screens.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {super.key, required this.taskModel, required this.borderColor});

  final TaskModel taskModel;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    TaskProvider provider = Provider.of<TaskProvider>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          border: Border.all(color: borderColor, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 3,
                  child: Text(taskModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: const Color(0xff5C5C5C),
                          fontWeight: FontWeight.bold,
                          fontSize: 15))),
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TaskModifierScreen(taskModel: taskModel)),
                            );
                          },
                          icon: const Icon(Icons.edit_outlined)),
                      IconButton(
                          onPressed: () {
                            provider.deleteTaskById(taskModel.id);
                          },
                          icon: const Icon(Icons.delete_outline)),
                      if (taskModel.status != Status.done)
                        IconButton(
                            onPressed: () {
                              provider.updateTaskById(taskModel.id);
                            },
                            icon: const Icon(Icons.check))
                    ],
                  ))
            ],
          ),
          const SizedBox(height: 12),
          Text(taskModel.content,
              style: GoogleFonts.poppins(
                  color: const Color(0xff5C5C5C),
                  fontWeight: FontWeight.normal,
                  fontSize: 13))
        ]),
      ),
    );
  }
}
