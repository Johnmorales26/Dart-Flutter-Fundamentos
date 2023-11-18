import 'package:flutter/material.dart';
import 'package:profile_app/screens/screens.dart';
import 'package:profile_app/shared_preferences/user_preferences.dart';
import 'package:profile_app/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff7C541C)),
        useMaterial3: true,
      ),
      initialRoute: HOME_SCREEN,
      routes: {
        HOME_SCREEN: (_) => const HomeScreen(),
        EDIT_SCREEN: (_) => const EditScreen(),
        SETTINGS_SCREEN: (_) => const SettingsScreen()
      },
    );
  }
}
