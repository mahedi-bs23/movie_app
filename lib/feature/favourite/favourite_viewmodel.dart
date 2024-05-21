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

  Future<bool> onClickAddToFavourite(FavouriteMovieModel movie) async {
    bool isPresent = await favouriteRepository.addToFavourite(movie);

    return isPresent;
  }

  void onClickRemoveFromFavourite(int index) async{
    bool isDeleted = await favouriteRepository.removeFromFavourite(index);
    if(isDeleted) {
      fetchFavouriteMovies();
    }
  }

  bool checkDuplicateMovie(FavouriteMovieModel movie) {

    print("Movie : $movie");

    if(_watchList.value.contains(movie)){
      print(_watchList.value.contains(movie));
      return true;
    }
    return false;

  }



}
