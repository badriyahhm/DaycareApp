import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  static DatabaseHelper get instance => _instance;

  Future<Database> get db async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'daycare.db');
    return await openDatabase(
      path,
      version: 2, // Pastikan versi terbaru
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS children (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        gender TEXT NOT NULL,
        parent_name TEXT NOT NULL,
        parent_contact TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS daily_reports (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        child_id INTEGER NOT NULL,
        date TEXT NOT NULL,
        arrival TEXT NOT NULL,
        body_temperature TEXT NOT NULL,
        conditions TEXT NOT NULL,
        other_item TEXT NOT NULL,
        FOREIGN KEY (child_id) REFERENCES children (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE daily_reports ADD COLUMN arrival TEXT');
    }
  }

  Future<void> verifyTableStructure() async {
    final dbClient = await db;
    List<Map<String, dynamic>> columns =
        await dbClient.rawQuery('PRAGMA table_info(daily_reports)');
    print(columns); // Cek kolom yang ada dalam tabel
  }

  Future<List<Map<String, dynamic>>> getDailyReports(int childId) async {
    final dbClient = await db;
    return await dbClient.query(
      'daily_reports',
      where: 'child_id = ?',
      whereArgs: [childId],
      orderBy: 'date DESC',
    );
  }

  Future<Map<String, dynamic>?> getDailyReportById(int id) async {
    final dbClient = await db;
    final List<Map<String, dynamic>> results = await dbClient.query(
      'daily_reports',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<int> insertDailyReport(Map<String, dynamic> report) async {
    final dbClient = await db;
    return await dbClient.insert('daily_reports', report);
  }

  Future<int> updateDailyReport(Map<String, dynamic> report) async {
    final dbClient = await db;
    return await dbClient.update(
      'daily_reports',
      report,
      where: 'id = ?',
      whereArgs: [report['id']],
    );
  }

  Future<int> deleteDailyReport(int id) async {
    final dbClient = await db;
    return await dbClient.delete(
      'daily_reports',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
