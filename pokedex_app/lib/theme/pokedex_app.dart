import 'package:flutter/material.dart';
import 'package:pokedex_app/provider/pokedex_provider.dart';
import 'package:pokedex_app/theme/app_typography.dart';
import 'package:pokedex_app/utils/constants.dart';
import 'package:pokedex_app/utils/routes.dart';
import 'package:provider/provider.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => PokedexProvider())],
        child: MaterialApp(
            title: 'Pokedex App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: textTheme,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0xff4855B5)),
              useMaterial3: true,
            ),
            initialRoute: homeScreen,
            routes: routes));
  }
}
