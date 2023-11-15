import 'dart:convert';

import 'package:pokedex_app/models/sprites_model.dart';
import 'package:pokedex_app/models/stat_element_model.dart';
import 'package:pokedex_app/models/type_model.dart';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  final int baseExperience;
  final int height;
  final int id;
  final String name;
  final int order;
  final SpritesModel sprites;
  final List<StatElementModel> stats;
  final List<TypeModel> types;
  final int weight;

  PokemonModel({
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.name,
    required this.order,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        name: json["name"],
        order: json["order"],
        sprites: SpritesModel.fromJson(json["sprites"]),
        stats: List<StatElementModel>.from(
            json["stats"].map((x) => StatElementModel.fromJson(x))),
        types: List<TypeModel>.from(
            json["types"].map((x) => TypeModel.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "name": name,
        "order": order,
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}
