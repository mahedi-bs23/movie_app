import 'package:flutter/foundation.dart';
import 'package:movie_app/data/local/local_movie_repository.dart';
import 'package:movie_app/data/local/movie_database.dart';
import 'package:movie_app/data/local/new_local_data_source.dart';
import 'package:movie_app/data/remote/api_client.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class HomeViewmodelTwo {
  final MovieDatabase movieDatabase = MovieDatabase.getInstance();

  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  ValueListenable<bool> get isLoading => _isLoading;

  final ValueNotifier<List<MovieModel?>> _localMovieData = ValueNotifier([]);

  ValueListenable<List<MovieModel?>> get localMovieData => _localMovieData;

  late final Stream<List<MovieModel?>> _movieDataStream;

  Stream<List<MovieModel?>> get movieDataStream => _movieDataStream;

  MovieRepository movieRepository;

  static HomeViewmodelTwo? _instance;

  static HomeViewmodelTwo getInstance(MovieDatabase movieDatabaseHelper) {
    _instance = _instance ??
        HomeViewmodelTwo(
          movieRepository: MovieRepositoryImpl(
            apiClient: ApiClient(),
            localDataSource: NewLocalDataSource(
              movieDatabase: MovieDatabase(),
            ),
          ),
        );
    return _instance!;
  }

  HomeViewmodelTwo({required this.movieRepository}) {
    _movieDataStream = movieRepository.getMovieList().asBroadcastStream();
    fetchMovieData();
  }

  fetchMovieData() {
    _localMovieData.value = [];
    if (kDebugMode) {
      _movieDataStream.listen(
        (movieList) {
          _localMovieData.value = movieList;
          print("movie list length in HomeviewModel: ${movieList.length}");
        },
      );
    }
    _isLoading.value = false;
  }
}
