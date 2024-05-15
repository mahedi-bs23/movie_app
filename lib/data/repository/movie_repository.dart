import 'package:movie_app/data/model/movie_list_response.dart';

abstract class MovieRepository {
  Future<MovieListResponse> getMovieList();
}
