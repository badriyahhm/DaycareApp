import 'package:daycare/screen/listanak.dart';
import 'package:flutter/material.dart';
import 'package:daycare/screen/login.dart';
import 'package:daycare/screen/home_orangtua.dart';
import 'package:daycare/screen/dailyreport.dart';
import 'package:daycare/models/datapengasuh.dart';
import 'package:daycare/models/database_helper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> resetDatabase() async {
  String path = join(await getDatabasesPath(), 'daycare.db');
  await deleteDatabase(path);
  print('Database deleted. Re-initializing...');
  final dbHelper = DatabaseHelper();
  await dbHelper.verifyTableStructure();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await resetDatabase();

  final dbHelper = DatabaseHelper();
  await dbHelper.verifyTableStructure();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daycare App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
