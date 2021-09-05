import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? database;

  Future<void> initDatabase() async {
    database = await openDatabase('my_db.db');
  }

  Future<void> closeDatabase() async {
    await database!.close();
  }
}
