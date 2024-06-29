import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:daycare/models/dataanak.dart';
import 'package:daycare/models/daily_report.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'daycare.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE children(
            id INTEGER PRIMARY KEY,
            namaAnak TEXT,
            dob TEXT,
            gender TEXT,
            parentName TEXT,
            parentContact TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE daily_reports(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            report TEXT,
            childId INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertChild(DataAnak child) async {
    final db = await database;
    return await db.insert('children', child.toMap());
  }

  Future<DataAnak?> getChildById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'children',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return DataAnak.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<DataAnak>> getAllChildren() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('children');

    return List.generate(maps.length, (i) {
      return DataAnak.fromMap(maps[i]);
    });
  }

  Future<int> insertDailyReport(DailyReport report) async {
    final db = await database;
    return await db.insert('daily_reports', report.toMap());
  }

  Future<List<DailyReport>> getDailyReportsByChildId(int childId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'daily_reports',
      where: 'childId = ?',
      whereArgs: [childId],
    );

    return List.generate(maps.length, (i) {
      return DailyReport.fromMap(maps[i]);
    });
  }
}
