

import 'package:movie_app/feature/home/model/movie_model.dart';

abstract class FavouriteRepository {
  Future<bool> addToFavourite(Movie movie);
  Future<bool> removeFromFavourite(Movie movie);
  Future<List<Movie>> getFavouriteMovies();
}