
import 'package:flutter/foundation.dart';
import 'package:movie_app/data/model/movie_list_response_model.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';

class HomeViewmodelTwo {

  final ValueNotifier<bool> _isLoading = ValueNotifier(true);
  ValueListenable<bool> get isLoading => _isLoading;

  final ValueNotifier<List?> _allMovieData = ValueNotifier(null);
  ValueListenable<List?> get allMovieData => _allMovieData;



  MovieRepository movieRepository = MovieRepositoryImpl();

  static HomeViewmodelTwo? _instance;

  static getInstance() {
    _instance = _instance ?? HomeViewmodelTwo();
    return _instance;
  }


  HomeViewmodelTwo() {
    getAllMovie();
  }

  Future getAllMovie() async {
    MovieListResponseModel movieListResponse = await movieRepository.getMovieList();
    _allMovieData.value = movieListResponse.data?.movies;

    print("Status code1 view model : ${allMovieData.value!.length}");


    print("Status code1 view model : ${movieListResponse.status}");

    if (movieListResponse.status == "ok") {
      print("Status code2 view model: ${movieListResponse.status}");
      _isLoading.value = false;

      ///print("Movie Data List Length: ${allMovieData.value?[6].backgroundImage}");
      //_imageUrl.value = allMovieData.value?[6].largeCoverImage;
      //print("Backround Image URL: ${imageUrl.value}");
    }
  }
}
