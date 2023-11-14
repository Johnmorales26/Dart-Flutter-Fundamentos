import 'package:flutter/material.dart';
import 'package:pokedex_app/models/menu_item.dart';
import 'package:pokedex_app/utils/constants.dart';

// ignore: must_be_immutable
class MainMenuItemButton extends StatelessWidget {
  MenuItem menuItem;

  MainMenuItemButton({super.key, required this.menuItem});

  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navegar a la pantalla de Pokedex
        Navigator.pushNamed(context, pokedexScreen);
        break;
      case 1:
        // Navegar a la pantalla de Moves
        Navigator.pushNamed(context, '/moves');
        break;
      case 2:
        // Navegar a la pantalla de Abilities
        Navigator.pushNamed(context, '/abilities');
        break;
      case 3:
        // Navegar a la pantalla de Items
        Navigator.pushNamed(context, '/items');
        break;
      case 4:
        // Navegar a la pantalla de Locations
        Navigator.pushNamed(context, '/locations');
        break;
      case 5:
        // Navegar a la pantalla de Type charts
        Navigator.pushNamed(context, '/typeCharts');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToScreen(context, menuItem.index),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
            color: menuItem.typeColor,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(menuItem.label,
                  style: const TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
