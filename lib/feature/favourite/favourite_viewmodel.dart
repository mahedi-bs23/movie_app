import 'package:flutter/foundation.dart';

import 'package:movie_app/data/repository/favourite_repository.dart';
import 'package:movie_app/data/repository/favourite_repository_impl.dart';
import 'package:movie_app/feature/favourite/model/favourite_movie_model.dart';

class FavouriteViewmodel {
  FavouriteRepository favouriteRepository = FavouriteRepositoryImpl();

  ValueNotifier<List<FavouriteMovieModel>> _watchList = ValueNotifier([]);

  ValueListenable<List<FavouriteMovieModel>> get watchList => _watchList;

  Future<void> fetchFavouriteMovies() async {
    List<FavouriteMovieModel> movies = await favouriteRepository.getFavouriteMovies();
    _watchList.value = [];
    _watchList.value = movies;
  }

  void onClickAddToFavourite(FavouriteMovieModel movie) async {
    await favouriteRepository.addToFavourite(movie);
  }

  void onClickRemoveFromFavourite(int index) async{
    bool isDeleted = await favouriteRepository.removeFromFavourite(index);
    if(isDeleted) {
      fetchFavouriteMovies();
    }
  }
}
