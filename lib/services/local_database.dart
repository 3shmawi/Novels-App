import 'package:novels/models/booked.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class NovelDatabase {
  static final NovelDatabase instance = NovelDatabase._init();

  static Database? _database;

  NovelDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('novel.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableNovel (${NovelFields.dbId} INTEGER PRIMARY KEY, ${NovelFields.title} TEXT, ${NovelFields.imgUrl} TEXT, ${NovelFields.authorName} TEXT, ${NovelFields.id} TEXT, ${NovelFields.novelText} TEXT, ${NovelFields.overview} TEXT, ${NovelFields.aboutTheAuthor} TEXT, ${NovelFields.category} TEXT)');
  }

  Future<BookedModel> insertDataToBookedDataBase({
    required BookedModel novel,
  }) async {
    final db = await instance.database;

    final id = await db.insert(tableNovel, novel.toMap());
    return novel.copy(dbId: id);
  }

  Future<List<BookedModel>> readAllNovelsBookedData() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM $tableNovel');

    return result.map((json) => BookedModel.fromMapWithoutId(json)).toList();
  }

  Future<int> updateBookedNovel({
    required BookedModel novel,
  }) async {
    final db = await instance.database;

    return db.update(
      tableNovel,
      novel.toMap(),
      where: '${NovelFields.dbId} = ?',
      whereArgs: [novel.dbId],
    );
  }

  Future<int> deleteBookedNovel({
    required int id,
  }) async {
    final db = await instance.database;

    return await db.delete(
      tableNovel,
      where: '${NovelFields.dbId} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'novel.db');
    await deleteDatabase(path);
    db.close();
  }

  Future delete() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'novel.db');
    await deleteDatabase(path);
  }
}
