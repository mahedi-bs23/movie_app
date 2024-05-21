import 'package:flutter/foundation.dart';

class FavouriteMovieModel {
  final String name;
  final String image;
  final String releaseYear;
  final String runtime;
  final String rating;

  FavouriteMovieModel({
    required this.name,
    required this.image,
    required this.releaseYear,
    required this.runtime,
    required this.rating,
  });

  factory FavouriteMovieModel.fromJson(Map<String, dynamic> json) {
    return FavouriteMovieModel(
      name: json['name'],
      image: json['image'],
      releaseYear: json['releaseYear'],
      runtime: json['runtime'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'releaseYear': releaseYear,
      'runtime': runtime,
      'rating': rating,
    };
  }
}
