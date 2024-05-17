import 'package:movie_app/feature/favourite/favourite_viewmodel.dart';

class FavouriteViewModelSingleton {
  static FavouriteViewmodel? favouriteViewmodel;

  static FavouriteViewmodel getInstance() {
     favouriteViewmodel ??= FavouriteViewmodel();
     return favouriteViewmodel!;
  }
}