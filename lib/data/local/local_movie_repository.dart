import 'dart:async';

import 'package:movie_app/data/model/movie_list_response_model.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/feature/home/model/movie_database.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class LocalMovieRepository {
  static LocalMovieRepository? localMovieRepo;

  static LocalMovieRepository getInstance() {
    localMovieRepo ??= LocalMovieRepository();
    return localMovieRepo!;
  }

  MovieRepository movieRepository = MovieRepositoryImpl();
  MovieDatabase movieDatabase = MovieDatabase();

  Future<List<Movies>> fetchData() async {
    try {
      MovieListResponseModel movieListResponseModel =
          await movieRepository.getMovieList();
      List<Movies> movies = movieListResponseModel.data?.movies ?? [];
      print(movies.length);
      movieDatabase.insertData(movies
          .map(
            (e) => MovieModel(
              apiId: e.id ?? 1,
              title: e.title ?? "",
              image: e.largeCoverImage ?? "",
              releaseYear: e.year ?? 2024,
              time: e.runtime ?? 23,
              rating: e.rating,
            ),
          )
          .toList());
      return movies;
    } catch (e) {
      List<MovieModel> moviesFromLocal = await movieDatabase.getMovieList();

      return moviesFromLocal
          .map(
            (e) => Movies(
                id: e.apiId,
                title: e.title,
                year: e.releaseYear,
                rating: e.rating,
                runtime: e.time,
                largeCoverImage: e.image),
          )
          .toList();
    }
  }
}
