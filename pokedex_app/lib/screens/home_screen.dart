import 'package:flutter/material.dart';
import 'package:pokedex_app/models/menu_item.dart';
import 'package:pokedex_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<MenuItem> _menu = [
    MenuItem(index: 0, label: 'Pokedex', typeColor: const Color(0xff4FC1A6)),
    MenuItem(index: 1, label: 'Moves', typeColor: const Color(0xffff4422)),
    MenuItem(index: 2, label: 'Abilities', typeColor: const Color(0xff429BED)),
    MenuItem(index: 3, label: 'Items', typeColor: const Color(0xffF0C03E)),
    MenuItem(index: 4, label: 'Locations', typeColor: const Color(0xff7766EE)),
    MenuItem(
        index: 5, label: 'Type charts', typeColor: const Color(0xffff5599)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xffD9D9D9),
          width: double.infinity,
          child: Column(
            children: [
              MainAppBar(menu: _menu),
            ],
          ),
        ),
      ),
    );
  }
}
