import 'package:sqflite/sqflite.dart';
import 'package:url_shortener/view/home/model/short_link_model.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._init();

  Database? _database;
  static DatabaseManager get instance => _instance;

  DatabaseManager._init() {
    openDatabase(
      'my_db.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE links(id INTEGER PRIMARY KEY, code TEXT, short_link TEXT, full_short_link TEXT, short_link2 TEXT, full_short_link2 TEXT, share_link TEXT, full_share_link TEXT, original_link TEXT)');
      },
    ).then((value) {
      _database = value;
    });
  }

  static Future databaseInit() async {
    instance._database ??= await openDatabase(
      'my_db.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE links(id INTEGER PRIMARY KEY, code TEXT, short_link TEXT, full_short_link TEXT, short_link2 TEXT, full_short_link2 TEXT, share_link TEXT, full_share_link TEXT, original_link TEXT)');
      },
    );
  }

  Future<void> closeDatabase() async {
    await _database!.close();
  }

  Future<void> insertLink(ShortLinkModel? model) async {
    if (model != null) {
      await _database!.insert('links', model.toJson());
    }
  }

  Future<void> removeLink(String code) async {
    await _database!.delete(
      'links',
      where: 'code = ?',
      whereArgs: [code],
    );
  }

  Future<List<ShortLinkModel>> getLinks() async {
    final data = await _database!.query('links');
    return data.map((e) => ShortLinkModel.fromJson(e)).toList();
  }
}
