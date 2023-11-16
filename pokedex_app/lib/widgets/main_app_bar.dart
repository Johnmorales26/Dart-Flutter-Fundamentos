import 'package:flutter/material.dart';
import 'package:pokedex_app/models/menu_item.dart';
import 'package:pokedex_app/widgets/widgets.dart';

class MainAppBar extends StatelessWidget {
  final List<MenuItem> menu;

  const MainAppBar({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            _buildHeaderText(context),
            const SizedBox(height: 32),
            const RoundedSearchBar(),
            const SizedBox(height: 32),
            _buildMenuGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Column(
      children: [
        Text(
          'What Pokémon\nare you looking for?',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMenuGrid() {
    return SizedBox(
      height: 300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          crossAxisCount: 2,
          childAspectRatio: 2.2,
        ),
        itemCount: menu.length,
        itemBuilder: (_, index) => MainMenuItemButton(menuItem: menu[index]),
      ),
    );
  }
}
