import 'package:flutter/foundation.dart';
import 'package:movie_app/data/local/local_data_source.dart';
import 'package:movie_app/data/local/local_movie_repository.dart';
import 'package:movie_app/data/model/movie_list_response_model.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:sqflite/sqflite.dart';

import 'model/movie_database.dart';

class HomeViewmodelTwo {
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);
  ValueListenable<bool> get isLoading => _isLoading;

  ValueNotifier<List<Movies>?> _allMovieData = ValueNotifier(null);
  ValueListenable<List?> get allMovieData => _allMovieData;


  LocalMovieRepository localMovieRepo = LocalMovieRepository.getInstance();


  MovieRepository movieRepository = MovieRepositoryImpl();

  static HomeViewmodelTwo? _instance;

  static getInstance() {
    _instance = _instance ?? HomeViewmodelTwo();
    return _instance;
  }

  HomeViewmodelTwo() {
    fetchData();
  }

   void fetchData() async {
    _allMovieData.value = await localMovieRepo.fetchData();
    print(_allMovieData.value?.length);
    _isLoading.value = false;
   }

  //
  // Stream<List<Movies>>? _movieDataStream;
  // Stream<List<Movies>>? get movieDataStream => _movieDataStream;
  //
  // Future getAllMovie() async {
  //
  //   //_movieDataStream = localMovieRepo.fetchData();
  //   //_isLoading.value = true;
  //
  //   _allMovieData.value = await localMovieRepo.fetchData();
  // }
}


