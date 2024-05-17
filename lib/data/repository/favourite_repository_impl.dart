import 'package:movie_app/data/local/local_data_source.dart';
import 'package:movie_app/data/repository/favourite_repository.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  LocalDataSource localDataSource = LocalDataSource();

  @override
  Future<bool> addToFavourite(Movie movie) {
    return localDataSource.addMovie(movie);
  }

  @override
  Future<List<Movie>> getFavouriteMovies() {
    return localDataSource.getMovies();
  }

  @override
  Future<bool> removeFromFavourite(Movie movie) {
    return localDataSource.removeMovie(movie);
  }
}
