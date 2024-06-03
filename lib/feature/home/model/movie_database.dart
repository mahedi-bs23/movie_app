import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

String fileName = "movie_database";

class MovieDatabase {
  static Database? _database;

  //String isField = 'id';

  static Database? _db;
  static final MovieDatabase instance = MovieDatabase._constructor();

  MovieDatabase._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'movie_data.db');
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $tableName
          $idField INTEGER PRIMARY KEY,
          $titleField TEXT NOT NULL,
          $imageField TEXT NOT NULL,
          $releaseYearField TEXT NOT NULL,
          $timeField TEXT NOT NULL,
          $ratingField REAL NOT NULL,
        ''');
      },
      version: 1,
    );
    return database;
  }

  Future<void> insertData(List<Movie> movie) async {
    final db = await database;
    for (var item in movie) {
      await db.insert(
        'movie_data',
        item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
  
  Future<List<Movie>> fetchData()async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('movie_data');

    return List.generate(maps.length, (i){
      return Movie.fromMap(maps[i]);
    });
  }
  
  
}
