import 'package:movie_app/data/model/movie_list_response_model.dart';

abstract class MovieRepository {
  Future<MovieListResponseModel> getMovieList();
}
