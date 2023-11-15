import 'package:pokedex_app/models/type_class_model.dart';

class StatElementModel {
  final int baseStat;
  final int effort;
  final TypeClassModel stat;

  StatElementModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatElementModel.fromJson(Map<String, dynamic> json) =>
      StatElementModel(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: TypeClassModel.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}
