import 'package:movie_app/data/local/local_data_source.dart';
import 'package:movie_app/data/repository/favourite_repository.dart';
import 'package:movie_app/feature/favourite/model/favourite_movie_model.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  LocalDataSource localDataSource = LocalDataSource();

  @override
  Future<bool> addToFavourite(FavouriteMovieModel movie) {
    return localDataSource.addMovie(movie);
  }

  @override
  Future<bool> removeFromFavourite(int index) {
    return localDataSource.removeMovie(index);
  }

  @override
  Future<List<FavouriteMovieModel>> getFavouriteMovies() {
    return localDataSource.getFavouriteMovies();
  }


}
