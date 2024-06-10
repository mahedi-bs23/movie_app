class FavouriteMovieModel {
  final String name;
  final String image;
  final int releaseYear;
  final int runtime;
  final double rating;

  FavouriteMovieModel({
    required this.name,
    required this.image,
    required this.releaseYear,
    required this.runtime,
    required this.rating,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FavouriteMovieModel &&
        other.name == name &&
        other.image == image &&
        other.releaseYear == releaseYear &&
        other.runtime == runtime &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        releaseYear.hashCode ^
        runtime.hashCode ^
        rating.hashCode;
  }

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
