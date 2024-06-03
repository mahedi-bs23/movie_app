
String tableName = 'movies';



String idField = 'id';
String titleField = 'title';
String imageField = 'image';
String releaseYearField = 'releaseYear';
String timeField = 'time';
String ratingField = 'rating';

class Movie {
  final String name;
  final String image;
  final String releaseYear;
  final String time;
  final dynamic rating;

  Movie({
    required this.name,
    required this.image,
    required this.releaseYear,
    required this.time,
    required this.rating,
  });

  /// convert into map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'releaseYear': releaseYear,
      'time': time,
      'rating': rating
    };
  }

  /// extract from map

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
        name: map['name'],
        image: map['image'],
        releaseYear: map['releaseYear'],
        time: map['time'],
        rating: map['rating']);
  }
}
