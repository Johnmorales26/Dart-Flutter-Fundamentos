import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/models/task_model.dart';

class TaskDatabaseHelper {
  // Cambio: Convertir estas constantes a variables convencionales de Dart
  static const _databaseName = 'TaskDatabase.db';
  static const _databaseVersion = 1;
  static const taskTable = 'TaskTable';

  // Cambio: Convertir estas constantes a variables convencionales de Dart
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnDescription = 'description';
  static const columnStatus = 'status';

  // Cambio: Convertir estas variables a variables convencionales de Dart
  static Database? _db;
  static final TaskDatabaseHelper db = TaskDatabaseHelper._();

  // Cambio: Agregado un constructor privado para implementar el patrón Singleton
  TaskDatabaseHelper._();

  // Cambio: Convertir estas variables a variables convencionales de Dart
  Future<Database?> get database async {
    // Cambio: Utilizar las variables convencionales de Dart
    if (_db != null) return _db;
    // Cambio: Utilizar las variables convencionales de Dart
    _db = await init();
    return _db;
  }

  // Cambio: Convertir estas variables a variables convencionales de Dart
  Future<Database> init() async {
    // Cambio: Utilizar las variables convencionales de Dart
    final documentsDirectory = await getApplicationDocumentsDirectory();
    // Cambio: Utilizar las variables convencionales de Dart
    final path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Cambio: Convertir estas variables a variables convencionales de Dart
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $taskTable (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle
  e TEXT NOT NULL,
        $columnDescription TEXT NOT NULL,
        $columnStatus TEXT NOT NULL
      )
    ''');
  }

  //  Helper Methods
  Future<int?> create(TaskModel taskModel) async {
    final db = await database;
    return await db?.insert(taskTable, taskModel.toJson());
  }

  Future<int?> createRaw(TaskModel taskModel) async {
    final db = await database;
    return await db?.rawInsert(
        ''' INSERT INTO $taskTable ( $columnId, $columnTitle, $columnDescription, $columnStatus ) VALUES ( ${taskModel.id}, '${taskModel.title}', '${taskModel.description}', '${taskModel.status}' ) ''');
  }

  Future<List<TaskModel>?> read(String status) async {
    final db = await database;
    final res = await db
        ?.query(taskTable, where: '$columnStatus = ?', whereArgs: [status]);
    return res!.isNotEmpty
        ? res.map((s) => TaskModel.fromJson(s)).toList()
        : [];
  }

  Future<List<TaskModel>?> readRaw(String status) async {
    final db = await database;
    final res = await db
        ?.rawQuery(''' SELECT * FROM $taskTable WHERE $columnStatus = '$status' ''');
    return res!.isNotEmpty
        ? res.map((s) => TaskModel.fromJson(s)).toList()
        : [];
  }

  Future<TaskModel?> readById(int idTask) async {
    final db = await database;
    final res =
        await db?.query(taskTable, where: '$columnId = ?', whereArgs: [idTask]);
    return res!.isNotEmpty ? TaskModel.fromJson(res.first) : null;
  }

  Future<int?> update(TaskModel taskModel) async {
    final db = await database;
    return await db?.update(taskTable, taskModel.toJson(),
        where: '$columnId = ?', whereArgs: [taskModel.id]);
  }

  Future<int?> updateRaw(TaskModel taskModel) async {
    final db = await database;
    return await db?.rawUpdate(
      'UPDATE $taskTable SET $columnTitle = ?, $columnDescription = ?, $columnStatus = ? WHERE $columnId = ?',
      [taskModel.title, taskModel.description, taskModel.status, taskModel.id],
    );
  }

  Future<int?> delete(int idTask) async {
    final db = await database;
    return await db
        ?.delete(taskTable, where: '$columnId = ?', whereArgs: [idTask]);
  }

  Future<int?> deleteRaw(int idTask) async {
    final db = await database;
    return await db
        ?.rawDelete('DELETE FROM $taskTable WHERE $columnId = ?', [idTask]);
  }
}
