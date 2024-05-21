import 'package:movie_app/data/local/local_data_source.dart';
import 'package:movie_app/feature/favourite/favourite_viewmodel.dart';

class FavouriteViewModelSingleton {
  static FavouriteViewmodel? favouriteViewmodel;

  /*static FavouriteViewmodel getInstance() {
     favouriteViewmodel ??= FavouriteViewmodel();
     return favouriteViewmodel!;
  }*/
  static FavouriteViewmodel getInstance() {
    if (favouriteViewmodel == null) {
      favouriteViewmodel = FavouriteViewmodel();
    }
    return favouriteViewmodel!;
  }
}

class LocalDataSourceSingleton{


  static LocalDataSource? localDataSource;

  static LocalDataSource getInstance(){
    localDataSource ??= LocalDataSource();

    return localDataSource!;
  }

}
