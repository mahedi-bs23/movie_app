
import 'package:movie_app/data/local/movie_database.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:sqflite/sqflite.dart';


class NewLocalDataSource {

  static const String fileName = "movie_database";

  MovieDatabase movieDatabase;

  NewLocalDataSource({required this.movieDatabase});

  Future<void> insertMovieData(List<MovieModel?> movies) async {
    final Database db = await movieDatabase.database;

    for (var movie in movies) {
      await db.insert(
        MovieDatabase.tableName,
        movie!.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<MovieModel?>> getMovieData() async {
    final Database db = await movieDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query(MovieDatabase.tableName);

    List<MovieModel?> movies = List.generate(maps.length, (i) {
      return MovieModel.fromMap(maps[i]);
    });
    return movies;
  }


  Future<void> deleteAllMovieFromTable() async{
    final Database db = await movieDatabase.database;
    await db.delete(MovieDatabase.tableName);
  }




}