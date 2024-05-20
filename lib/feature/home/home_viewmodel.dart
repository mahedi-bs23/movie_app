import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/feature/home/model/movie_list_category.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';


class HomeViewmodel {
  List<Movie> specialMovies = [
    Movie(
      name: "Oppenheimer",
      image: "assets/openeimer.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.5",
    ),
    Movie(
      name: "Guardian",
      image: "assets/guardian.jpg",
      releaseYear: "2014",
      time: "1h 50m",
      rating: "6.7",
    ),
    Movie(
      name: "Scent",
      image: "assets/scent.jpg",
      releaseYear: "2008",
      time: "2h 10m",
      rating: "8.2",
    ),
    Movie(
      name: "Raid",
      image: "assets/raid.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.1",
    ),
    Movie(
      name: "Kalki",
      image: "assets/kalki.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.9",
    ),
  ];

  List<Movie> topMovies = [
    Movie(
      name: "Spiderman Acros The Spider",
      image: "assets/spiderman_across.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.5",
    ),
    Movie(
      name: "Parasite",
      image: "assets/parasite.jpg",
      releaseYear: "2014",
      time: "1h 50m",
      rating: "6.7",
    ),
    Movie(
      name: "Opperheimer",
      image: "assets/openeimer.jpg",
      releaseYear: "2008",
      time: "2h 10m",
      rating: "8.2",
    ),
    Movie(
      name: "Spiderman",
      image: "assets/spiderman.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.1",
    ),
    Movie(
      name: "Spiderman",
      image: "assets/spiderman.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.9",
    ),
    Movie(
      name: "Parasite",
      image: "assets/parasite.jpg",
      releaseYear: "2014",
      time: "1h 50m",
      rating: "9.1",
    ),
    Movie(
      name: "Opperheimer",
      image: "assets/openeimer.jpg",
      releaseYear: "2008",
      time: "2h 10m",
      rating: "5.1",
    ),
    Movie(
      name: "Spiderman",
      image: "assets/spiderman.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.1",
    ),
  ];

  List<Movie> upcomingMovies = [
    Movie(
      name: "Imax",
      image: "assets/imax.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.5",
    ),
    Movie(
      name: "Guardian",
      image: "assets/guardian.jpg",
      releaseYear: "2014",
      time: "1h 50m",
      rating: "6.7",
    ),
    Movie(
      name: "Scent",
      image: "assets/scent.jpg",
      releaseYear: "2008",
      time: "2h 10m",
      rating: "8.2",
    ),
    Movie(
      name: "Raid",
      image: "assets/raid.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.1",
    ),
    Movie(
      name: "Kalki",
      image: "assets/kalki.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.9",
    ),
    Movie(
      name: "Parasite",
      image: "assets/parasite.jpg",
      releaseYear: "2014",
      time: "1h 50m",
      rating: "9.1",
    ),
    Movie(
      name: "Opperheimer",
      image: "assets/openeimer.jpg",
      releaseYear: "2008",
      time: "2h 10m",
      rating: "5.1",
    ),
    Movie(
      name: "Bombay",
      image: "assets/bombay.jpg",
      releaseYear: "2010",
      time: "2h 30m",
      rating: "5.1",
    ),
  ];


  final ValueNotifier<List<Movie>> _movieList = ValueNotifier(List.empty());

  ValueNotifier<List<Movie>> get movieList => _movieList;






  void onInit(MovieListCategory movieListCategory) {

    switch (movieListCategory) {
      case MovieListCategory.topMovies:
        movieList.value = topMovies;
      case MovieListCategory.upcomingMovies:
        movieList.value = upcomingMovies;
      case MovieListCategory.specialMovies:
        movieList.value = specialMovies;
    }
  }

}
