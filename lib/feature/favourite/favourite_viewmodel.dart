import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:movie_app/data/repository/favourite_repository.dart';
import 'package:movie_app/data/repository/favourite_repository_impl.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class FavouriteViewmodel {
  FavouriteRepository favouriteRepository = FavouriteRepositoryImpl();

  ValueNotifier<List<Movie>> _watchList = ValueNotifier([]);

  ValueListenable<List<Movie>> get watchList => _watchList;

  Future<void> fetchFavouriteMovies() async {
    List<Movie> movies = await favouriteRepository.getFavouriteMovies();
    _watchList.value = movies;
  }

  void onClickAddToFavourite(Movie movie) async {
    await favouriteRepository.addToFavourite(movie);
  }
}
