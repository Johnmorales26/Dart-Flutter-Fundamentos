import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/widgets.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const MediumTopAppBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 8), // Ajusta este valor según tus necesidades
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return PokemonCard();
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
