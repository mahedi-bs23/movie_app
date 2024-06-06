import 'package:movie_app/feature/home/model/movie_model.dart';

abstract class MovieRepository {
  Stream<List<MovieModel?>> getMovieList();
}
