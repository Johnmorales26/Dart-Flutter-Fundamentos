import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/provider/pokedex_provider.dart';
import 'package:pokedex_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class DetailPokemonScreen extends StatelessWidget {
  const DetailPokemonScreen({Key? key, required this.idPokemon})
      : super(key: key);

  final int idPokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokedexProvider>(context);
    final pokemon = pokemonProvider.searchPokemonById(idPokemon);

    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          MediumTopAppBar(title: capitalize(pokemon.name), id: pokemon.id),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _MainData(pokemon: pokemon),
                _CardData(pokemon: pokemon),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CardData extends StatelessWidget {
  final PokemonModel pokemon;

  const _CardData({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Base Stats', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 32),
            ...pokemon.stats.map((stat) => Column(
                  children: [
                    BaseStats(stat: stat),
                    const SizedBox(height: 16),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class _MainData extends StatelessWidget {
  final PokemonModel pokemon;

  const _MainData({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pokemon.types.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TypeLabel(type: pokemon.types[index].type.name),
                    const SizedBox(width: 8),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    pokemon.sprites.other.officialArtwork.frontDefault,
                    height: 240,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.network(
                    pokemon.sprites.other.officialArtwork.frontShiny,
                    height: 240,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
