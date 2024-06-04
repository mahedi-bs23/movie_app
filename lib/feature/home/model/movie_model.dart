class MovieModel {
  final int apiId;
  final String title;
  final String image;
  final int releaseYear;
  final int time;
  final double rating;

  MovieModel({
    required this.apiId,
    required this.title,
    required this.image,
    required this.releaseYear,
    required this.time,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'apiId': apiId,
      'title': title,
      'image': image,
      'release_year': releaseYear,
      'time': time,
      'rating': rating,
    };
  }

  static MovieModel fromMap(Map<String, dynamic> map) {
    return MovieModel(
      apiId: map['apiId'],
      title: map['title'],
      image: map['image'],
      releaseYear: map['release_year'],
      time: map['time'],
      rating: map['rating'],
    );
  }
}
