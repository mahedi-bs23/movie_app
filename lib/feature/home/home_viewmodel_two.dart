import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/data/model/movie_list_response.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/data/repository/movie_repository_impl2.dart';
import 'package:movie_app/repository/get_all_movie_repository.dart';

class HomeViewmodelTwo {
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  ValueNotifier<bool> get isLoading => _isLoading;

  final ValueNotifier<List?> _allMovieData = ValueNotifier(null);

  ValueNotifier<List?> get allMovieData => _allMovieData;

  final ValueNotifier<String> _imageUrl = ValueNotifier("");

  ValueListenable<String> get imageUrl => _imageUrl;

  MovieRepository movieRepository = MovieRepositoryImpl();

  Future getAllMovie() async {
    MovieListResponse movieListResponse = await movieRepository.getMovieList();
    allMovieData.value = movieListResponse.data?.movies;
    print(movieListResponse.status);

    if (movieListResponse.status == Stat.OK) {
      isLoading.value = false;

      ///print("Movie Data List Length: ${allMovieData.value?[6].backgroundImage}");
      _imageUrl.value = allMovieData.value?[6].largeCoverImage;
      print("Backround Image URL: ${imageUrl.value}");
    }
  }
}
