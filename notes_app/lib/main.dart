import 'package:flutter/material.dart';
import 'package:notes_app/provider/task_provider.dart';
import 'package:notes_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => TaskProvider())],
        child: MaterialApp(
          title: 'Notes App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff2563DC)),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}
