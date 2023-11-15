import 'package:pokedex_app/models/official_artwork_model.dart';

class OtherModel {
  final OfficialArtworkModel officialArtwork;

  OtherModel({
    required this.officialArtwork,
  });

  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
        officialArtwork:
            OfficialArtworkModel.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork.toJson(),
      };
}
