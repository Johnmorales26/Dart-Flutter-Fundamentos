import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/utils/utils.dart';
import 'package:pokedex_app/widgets/widgets.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemonModel}) : super(key: key);

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffD9D9D9)),
      ),
      height: 144,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: buildLeftColumn(),
            ),
            Expanded(
              flex: 1,
              child: buildRightColumn(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          capitalize(pokemonModel.name),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pokemonModel.types.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  TypeLabel(type: pokemonModel.types[index].type.name),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildRightColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          formatNumberWithHash(pokemonModel.id),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black.withAlpha(128),
          ),
        ),
        Image.network(
          pokemonModel.sprites.other.officialArtwork.frontDefault,
          width: 80,
          height: 80,
        ),
      ],
    );
  }
}
