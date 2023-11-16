import 'package:flutter/material.dart';
import 'package:pokedex_app/models/stat_element_model.dart';
import 'package:pokedex_app/utils/utils.dart';

class BaseStats extends StatelessWidget {

  final StatElementModel stat;

  const BaseStats({super.key, required this.stat});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: Text(capitalize(stat.stat.name))),
        Expanded(flex: 1, child: Text(stat.baseStat.toString(), textAlign: TextAlign.center)),
        Expanded(flex: 4,child: LinearProgressIndicator(value: stat.baseStat.toDouble() / 255))
      ],
    );
  }

}