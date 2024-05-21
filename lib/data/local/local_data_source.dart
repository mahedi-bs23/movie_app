import 'dart:convert';

import 'package:movie_app/feature/favourite/model/favourite_movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {

  static const favouriteMovieSharedPrefKey = "favouriteMovies";
  List<FavouriteMovieModel> _favouriteMovies = [];

  late SharedPreferences prefs;

  LocalDataSource() {
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<List<FavouriteMovieModel>> getFavouriteMovies() async {
    _favouriteMovies = await _getMoviesFromSharedPref() ?? [];
    return Future.value(_favouriteMovies);
  }

  Future<bool> addMovie(FavouriteMovieModel movie) async {
    try {
      print("Is Present in local data sourse: ${_favouriteMovies.contains(movie)}");
      _favouriteMovies = await _getMoviesFromSharedPref() ?? [];
      if(_favouriteMovies.contains(movie)){
        return Future.value(false);
      }
      _favouriteMovies.add(movie);
      await _saveMoviesToSharedPref();
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<bool> removeMovie(int index) async {
    try {
      print("Remove at Index: $index");
      _favouriteMovies = await _getMoviesFromSharedPref() ?? [];
      _favouriteMovies.removeAt(index);
      await _saveMoviesToSharedPref();
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<List<FavouriteMovieModel>?> _getMoviesFromSharedPref() async {
    try {
      final encodedJsonString = prefs.getString(favouriteMovieSharedPrefKey);
      if(encodedJsonString != null) {
        _favouriteMovies = (json.decode(encodedJsonString) as List<dynamic>)
          .map<FavouriteMovieModel>((e) => FavouriteMovieModel.fromJson(e))
          .toList();
      }
      return Future.value(_favouriteMovies);
    } catch(e) {
      return Future.value();
    }
  }

  Future<bool> _saveMoviesToSharedPref() async {
    final encodedJson = json.encode(
      _favouriteMovies
          .map<Map<String, dynamic>>((e) => e.toJson())
          .toList(),
    );
    try {
      await prefs.setString(favouriteMovieSharedPrefKey, encodedJson);
      return Future.value(true);
    } catch(e) {
      return Future.value(false);
    }
  }

}
