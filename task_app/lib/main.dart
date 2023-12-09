import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/task_provider.dart';
import 'package:task_app/providers/ui_provider.dart';
import 'package:task_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider())
      ],
      child: MaterialApp(
        title: 'Task App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2563DC)),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
