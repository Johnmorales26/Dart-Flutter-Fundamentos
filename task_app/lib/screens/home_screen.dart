import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/device_type.dart';
import 'package:task_app/providers/ui_provider.dart';
import 'package:task_app/screens/screens.dart';
import 'package:task_app/screens/task_screen.dart';
import 'package:task_app/utils/adaptative.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Obtener el ptovider
    final uiProvider = Provider.of<UiProvider>(context);
    //  Obtener el tipo de dispositivo
    DeviceType deviceType = getDeviceType(context);
    if (deviceType == DeviceType.smartphone ||
        deviceType == DeviceType.tablet) {
      return _SizedSmallView(uiProvider: uiProvider);
    } else {
      return _SezedLargeView(deviceType: deviceType);
    }
  }
}

class _SezedLargeView extends StatelessWidget {
  final DeviceType deviceType;

  const _SezedLargeView({required this.deviceType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Minder', style: GoogleFonts.poppins()),
        actions: [
          FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaskScreen()));
              },
              label: Text('New Task', style: GoogleFonts.poppins()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Row(
        children: [
          SizedBox(width: deviceType == DeviceType.largeScreen ? 32 : 64),
          const Expanded(child: TodoScreen()),
          SizedBox(width: deviceType == DeviceType.largeScreen ? 12 : 24),
          const Expanded(child: InProgressScreen()),
          SizedBox(width: deviceType == DeviceType.largeScreen ? 12 : 24),
          const Expanded(child: DoneScreen()),
          SizedBox(width: deviceType == DeviceType.largeScreen ? 32 : 64),
        ],
      ),
    );
  }
}

class _SizedSmallView extends StatelessWidget {
  final UiProvider uiProvider;

  const _SizedSmallView({required this.uiProvider});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TaskMinder', style: GoogleFonts.poppins()),
            centerTitle: true,
            bottom: TabBar(
                indicatorColor: uiProvider.color,
                onTap: (index) {
                  uiProvider.updateColorByIndex(context, index);
                },
                tabs: [
                  Tab(
                    icon: const Icon(Icons.cloud_outlined,
                        color: Color(0xff14367b)),
                    child: Text('ToDo',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff14367b))),
                  ),
                  Tab(
                    icon: const Icon(Icons.beach_access_sharp,
                        color: Color(0xff8f4f00)),
                    child: Text('In Progress',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff8f4f00))),
                  ),
                  Tab(
                    icon: const Icon(Icons.brightness_5_sharp,
                        color: Color(0xff81290e)),
                    child: Text('Done',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff81290e))),
                  ),
                ]),
          ),
          body: const TabBarView(
              children: [TodoScreen(), InProgressScreen(), DoneScreen()]),
          floatingActionButton: FloatingActionButton(
              backgroundColor: uiProvider.color,
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaskScreen()));
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
