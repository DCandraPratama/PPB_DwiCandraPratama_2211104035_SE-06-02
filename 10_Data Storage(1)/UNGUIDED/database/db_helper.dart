import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "mahasiswa.db";
  static final _databaseVersion = 1;

  static final table = 'mahasiswa';

  static final columnId = 'id';
  static final columnName = 'nama';
  static final columnNim = 'nim';
  static final columnAlamat = 'alamat';
  static final columnHobi = 'hobi';

  // Singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnNim TEXT NOT NULL,
        $columnAlamat TEXT NOT NULL,
        $columnHobi TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertMahasiswa(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> getMahasiswa() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }
}
