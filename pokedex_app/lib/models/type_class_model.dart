class TypeClassModel {
  final String name;

  TypeClassModel({
    required this.name,
  });

  factory TypeClassModel.fromJson(Map<String, dynamic> json) => TypeClassModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
