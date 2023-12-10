class TaskModel {
  int id;
  String title;
  String description;
  String status;

  // Constructor
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  // Método para convertir un objeto TaskModel a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }

  // Factor de fábrica para crear un objeto TaskModel desde un mapa (JSON)
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
    );
  }
}
