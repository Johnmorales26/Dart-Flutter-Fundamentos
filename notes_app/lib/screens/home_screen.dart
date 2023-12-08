import 'package:flutter/material.dart';
import 'package:notes_app/provider/task_provider.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Obtener el provider
    final taskProvider = Provider.of<TaskProvider>(context);
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TaskMinder'),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: taskProvider.color,
              onTap: (index) {
                taskProvider.updateColorByFab(context, index);
              },
              tabs: const [
                Tab(
                  icon: Icon(Icons.cloud_outlined, color: Color(0xff14367B)),
                  child:
                      Text('ToDo', style: TextStyle(color: Color(0xff14367B))),
                ),
                Tab(
                  icon:
                      Icon(Icons.beach_access_sharp, color: Color(0xff8F4F00)),
                  child: Text('In Progress',
                      style: TextStyle(color: Color(0xff8F4F00))),
                ),
                Tab(
                  icon:
                      Icon(Icons.brightness_5_sharp, color: Color(0xff81290E)),
                  child:
                      Text('Done', style: TextStyle(color: Color(0xff81290E))),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[TodoScreen(), InProgressScreen(), DoneScreen()],
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: taskProvider.color,
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskModifierScreen()),
                );
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
