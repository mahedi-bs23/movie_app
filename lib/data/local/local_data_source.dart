

import 'package:movie_app/feature/home/model/movie_model.dart';

class LocalDataSource {
  List<Movie> favouriteMovies = [];

  Future<bool> addMovie(Movie movie) async {
    try {
      favouriteMovies.add(movie);
      return Future.value(true);
    } catch(e) {
      return Future.value(false);
    }
  }

  Future<bool> removeMovie(Movie movie) async {
    try {
      favouriteMovies.remove(movie);
      return Future.value(true);
    } catch(e) {
      return Future.value(false);
    }
  }

  Future<List<Movie>> getMovies() async {
    return favouriteMovies;
  }
}
