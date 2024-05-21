

import 'package:movie_app/feature/favourite/model/favourite_movie_model.dart';

abstract class FavouriteRepository {
  Future<bool> addToFavourite(FavouriteMovieModel movie);
  Future<bool> removeFromFavourite(int index);
  Future<List<FavouriteMovieModel>> getFavouriteMovies();
}