import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/widgets.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard({Key? key}) : super(key: key);

  final List<String> types = ['Grass', 'Poison'];

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
        const Text(
          'Bulbasaur',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: types.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  TypeLabel(type: types[index]),
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
          '#001',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black.withAlpha(128),
          ),
        ),
        Image.network(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
          width: 80,
          height: 80,
        ),
      ],
    );
  }
}
