import 'package:flutter/material.dart';
import 'package:pokedex_app/provider/pokedex_provider.dart';
import 'package:pokedex_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Obtener el provider de pokemon
    final pokemonProvider = Provider.of<PokedexProvider>(context);
    //  Obtener lista de Pokemon
    final pokemons = pokemonProvider.pokemons;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const MediumTopAppBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8), // Ajusta este valor según tus necesidades
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return PokemonCard(pokemonModel: pokemons[index]);
                },
                childCount: pokemons.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        pokemonProvider.fetchMorePokemons();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
