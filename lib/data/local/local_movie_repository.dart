import 'dart:async';

import 'package:movie_app/data/local/movie_database.dart';
import 'package:movie_app/data/model/movie_list_response_model.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class LocalMovieRepository {
  static LocalMovieRepository? _instance;

  static LocalMovieRepository getInstance() {
    _instance ??= LocalMovieRepository();
    return _instance!;
  }

  final MovieRepository movieRepository = MovieRepositoryImpl();
  final MovieDatabase movieDatabaseHelper = MovieDatabase();

  Stream<List<MovieModel?>> fetchMovieData() async* {
    try {
      // Fetch data from the remote API
      MovieListResponseModel movieListResponse =
      await movieRepository.getMovieList();
      List<Movies>? movieDataFromRemote = movieListResponse.data?.movies ?? [];

      // Map the remote data to the local MovieModel format
      List<MovieModel?> movieDataFromLocal = movieDataFromRemote.map((item) {
        return MovieModel(
          id: item.id ?? 6776,
          title: item.title ?? "no title",
          image: item.largeCoverImage ?? "no image",
          releaseYear: item.year ?? 2024,
          time: item.runtime ?? 2,
          rating: item.rating ?? 5.5,
        );
      }).toList();

     // await movieDatabaseHelper.insertMovieData(movieDataFromLocal);

      yield movieDataFromLocal;
    } catch (e) {
      // In case of an error, fetch the data from the local database
      yield* movieDatabaseHelper.getLocalMovieData().map((movieList) => movieList);
    }
  }
}
