import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/clothing_item.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('fashion.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE clothes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      imagePath TEXT,
      category TEXT,
      color TEXT
    )
    ''');
  }

  Future<int> insertClothing(ClothingItem item) async {
    final db = await instance.database;
    return await db.insert('clothes', item.toMap());
  }

  Future<List<Map<String, dynamic>>> getClothes() async {
    final db = await instance.database;
    return await db.query('clothes');
  }
}
