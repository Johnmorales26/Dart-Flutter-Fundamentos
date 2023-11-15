import 'package:pokedex_app/models/other_model.dart';

class SpritesModel {
  final OtherModel other;

  SpritesModel({
    required this.other,
  });

  factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
        other: OtherModel.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "other": other.toJson(),
      };
}
