import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "app.db";
  static const _databaseVersion = 1;

  DatabaseHelper._internal();
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // Initializes the database in your phone
  Future<Database> _initDatabase() async {
    final dbPath =
        await getDatabasesPath(); //creates a path(folder) for the database in your phone
    String path = join(dbPath, _databaseName); // joins the path & databaseName

    // opens the database
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // creates your database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE User(id INTEGER PRIMARY KEY, score INTEGER)",
    );
  }
}
