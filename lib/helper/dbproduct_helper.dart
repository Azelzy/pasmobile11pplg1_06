import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:pasmobile11pplg1_06/models/fakestore_model.dart';

class DbProductHelper {
  static const String tableName = 'favorites';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnPrice = 'price';
  static const String columnDescription = 'description';
  static const String columnCategory = 'category';
  static const String columnImage = 'image';
  static const String columnRate = 'rate';
  static const String columnCount = 'count';

  static final DbProductHelper _instance = DbProductHelper._internal();
  static Database? _database;

  factory DbProductHelper() {
    return _instance;
  }

  DbProductHelper._internal();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final dbPath = path.join(databasePath, 'favorites.db');

    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT,
            $columnPrice REAL,
            $columnDescription TEXT,
            $columnCategory TEXT,
            $columnImage TEXT,
            $columnRate REAL,
            $columnCount INTEGER
          )
          ''');
      },
    );
  }

  // Add product to favorites
  Future<int> addToFavorites(FakeStoreModel product) async {
    final db = await database;
    return db.insert(tableName, {
      columnId: product.id,
      columnTitle: product.title,
      columnPrice: product.price,
      columnDescription: product.description,
      columnCategory: product.category.name,
      columnImage: product.image,
      columnRate: product.rating.rate,
      columnCount: product.rating.count,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Remove product from favorites
  Future<int> removeFromFavorites(int productId) async {
    final db = await database;
    return db.delete(tableName, where: '$columnId = ?', whereArgs: [productId]);
  }

  // Get all favorite products
  Future<List<FakeStoreModel>> getAllFavorites() async {
    final db = await database;
    final maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      final categoryValue = maps[i][columnCategory] as String;
      return FakeStoreModel(
        id: maps[i][columnId] as int,
        title: maps[i][columnTitle] as String,
        price: maps[i][columnPrice] as double,
        description: maps[i][columnDescription] as String,
        category: Category.values.firstWhere(
          (e) => e.name == categoryValue,
          orElse: () => Category.ELECTRONICS,
        ),
        image: maps[i][columnImage] as String,
        rating: Rating(
          rate: maps[i][columnRate] as double,
          count: maps[i][columnCount] as int,
        ),
      );
    });
  }

  // Check if product is in favorites
  Future<bool> isFavorite(int productId) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: '$columnId = ?',
      whereArgs: [productId],
    );
    return result.isNotEmpty;
  }

  // Get favorite count
  Future<int> getFavoriteCount() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM $tableName',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  // Clear all favorites
  Future<int> clearAllFavorites() async {
    final db = await database;
    return db.delete(tableName);
  }
}
