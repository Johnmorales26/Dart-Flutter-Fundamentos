class OfficialArtworkModel {
  final String frontDefault;
  final String frontShiny;

  OfficialArtworkModel({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) =>
      OfficialArtworkModel(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}
