import 'package:movie_app/data/model/movie_list_response_model.dart';

class MovieModel {
  final int? id;
  final String? title;
  final String? image;
  final int? releaseYear;
  final int? time;
  final double? rating;

  MovieModel({
     this.id,
     this.title,
     this.image,
     this.releaseYear,
     this.time,
     this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'apiId': id,
      'title': title,
      'image': image,
      'release_year': releaseYear,
      'time': time,
      'rating': rating,
    };
  }

  static MovieModel fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['apiId'],
      title: map['title'],
      image: map['image'],
      releaseYear: map['release_year'],
      time: map['time'],
      rating: map['rating'],
    );
  }

  factory MovieModel.fromMovies(Movies movie) {
    return MovieModel(
      id: movie.id,
      title: movie.title,
      image: movie.largeCoverImage,
      releaseYear: movie.year,
      time: movie.runtime,
      rating: movie.rating.toDouble()
    );
  }
}
