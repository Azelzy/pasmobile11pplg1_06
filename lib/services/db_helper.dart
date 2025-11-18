import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> db() async {
    if (_db != null) return _db!;

    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), "bookmark.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE bookmarks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            price REAL,
            category TEXT,
            image TEXT
          )
        """);
      },
    );
  }

  // insert
  static Future<int> insert(Map<String, dynamic> data) async {
    final dbClient = await db();
    return await dbClient.insert("bookmarks", data);
  }

  // get all
  static Future<List<Map<String, dynamic>>> getBookmarks() async {
    final dbClient = await db();
    return await dbClient.query("bookmarks");
  }

  // delete
  static Future<int> delete(String title) async {
    final dbClient = await db();
    return await dbClient.delete("bookmarks", where: "title = ?", whereArgs: [title]);
  }

  // check exists
  static Future<bool> isBookmarked(String title) async {
    final dbClient = await db();
    final res = await dbClient.query("bookmarks", where: "title = ?", whereArgs: [title]);
    return res.isNotEmpty;
  }
}