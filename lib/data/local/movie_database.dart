import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MovieDatabase {
  static const String fileName = "movie_database";

  static const String tableName = 'movies';
  static const String idField = 'id';
  static const String apiIdField = 'apiId';
  static const String titleField = 'title';
  static const String imageField = 'image';
  static const String releaseYearField = 'release_year';
  static const String timeField = 'time';
  static const String ratingField = 'rating';


  static MovieDatabase? instence;

  static  getInstance(){
    instence  = instence ?? MovieDatabase();
    return instence!;
  }


  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, '$fileName.db');
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $tableName (
          $idField INTEGER PRIMARY KEY AUTOINCREMENT,
          $apiIdField INTEGER,
          $titleField TEXT,
          $imageField TEXT,
          $releaseYearField INTEGER,
          $timeField INTEGER,
          $ratingField REAL
        );
        ''');
      },
      version: 1,
    );
    return database;
  }

  Future<void> insertMovieData(List<MovieModel?> movies) async {
    final Database db = await database;

    for (var movie in movies) {
      await db.insert(
        tableName,
        movie!.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    }
  Stream<List<MovieModel?>> getLocalMovieData() async* {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    List<MovieModel?> movies = List.generate(maps.length, (i) {
      return MovieModel.fromMap(maps[i]);
    });

    yield movies;

  }
}
