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
}
