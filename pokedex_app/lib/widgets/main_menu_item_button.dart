import 'package:flutter/material.dart';
import 'package:pokedex_app/models/menu_item.dart';
import 'package:pokedex_app/provider/pokedex_provider.dart';
import 'package:pokedex_app/utils/constants.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainMenuItemButton extends StatelessWidget {
  MenuItem menuItem;

  MainMenuItemButton({super.key, required this.menuItem});

  void navigateToScreen(
      BuildContext context, int index, PokedexProvider pokedexProvider) {
    switch (index) {
      case 0:
        //  Realizar petición GET
        pokedexProvider.fetchPokemons();
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
    //  Obtener el provider de pokemon
    final pokedexProvider = Provider.of<PokedexProvider>(context);
    return InkWell(
      onTap: () {
        //  Navegar a la pantalla de Pokedex
        navigateToScreen(context, menuItem.index, pokedexProvider);
      },
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
