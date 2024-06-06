import 'package:flutter/foundation.dart';
import 'package:movie_app/data/local/local_movie_repository.dart';
import 'package:movie_app/data/local/movie_database.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class HomeViewmodelTwo {
  final MovieDatabase movieDatabaseHelper =
      MovieDatabase.getInstance();

  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  ValueListenable<bool> get isLoading => _isLoading;

  final ValueNotifier<List<MovieModel?>> _allMovieData = ValueNotifier([]);

  ValueListenable<List<MovieModel?>>? get allMovieData => _allMovieData;

  final ValueNotifier<List<MovieModel?>> _localMovieData = ValueNotifier([]);

  ValueListenable<List<MovieModel?>> get localMovieData => _localMovieData;

  late final Stream<List<MovieModel?>> _movieDataStream;

  Stream<List<MovieModel?>> get movieDataStream => _movieDataStream;

  LocalMovieRepository localMovieRepo = LocalMovieRepository.getInstance();
  MovieRepository movieRepository = MovieRepositoryImpl();

  static HomeViewmodelTwo? _instance;

  static HomeViewmodelTwo getInstance(MovieDatabase movieDatabaseHelper) {
    _instance = _instance ?? HomeViewmodelTwo();
    return _instance!;
  }

  HomeViewmodelTwo() {
    _movieDataStream =
        movieDatabaseHelper.getLocalMovieData().asBroadcastStream();
    fetchMovieData();
  }

  fetchMovieData() {
    _localMovieData.value = [];
    if (kDebugMode) {
      _movieDataStream.listen(
        (movieList) {
          print("movie list length in HomeviewModel: ${movieList.length}");
          _localMovieData.value = movieList;
        },
      );
    }
    _isLoading.value = false;
  }
}
