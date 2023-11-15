import 'package:flutter/material.dart';

class MediumTopAppBar extends StatelessWidget {
  const MediumTopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
      title: Text('Pokedex',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w900)),
    );
  }
}