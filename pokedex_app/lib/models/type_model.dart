import 'package:pokedex_app/models/type_class_model.dart';

class TypeModel {
  final int slot;
  final TypeClassModel type;

  TypeModel({
    required this.slot,
    required this.type,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        slot: json["slot"],
        type: TypeClassModel.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
