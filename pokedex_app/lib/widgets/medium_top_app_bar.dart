import 'package:flutter/material.dart';
import 'package:pokedex_app/utils/utils.dart';

class MediumTopAppBar extends StatelessWidget {
  const MediumTopAppBar({super.key, required this.title, this.id});

  final String title;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w900)),
      actions: [
        if (id != null)
          Text('${formatNumberWithHash(id!)}  ',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w900, color: const Color(0x80000000))),
      ],
    );
  }
}
