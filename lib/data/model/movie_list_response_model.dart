class MovieListResponseModel {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  MovieListResponseModel(
      {this.status, this.statusMessage, this.data, this.meta});

  MovieListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? new Meta.fromJson(json['@meta']) : null;
  }
}

class Data {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movies>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  Data.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
  }
}

class Movies {
  int? id;
  String? title;
  int? year;
  dynamic rating;
  int? runtime;
  List<dynamic>? genres;
  String? largeCoverImage;

  Movies({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    this.genres,
    required this.largeCoverImage,
  });

  Movies.toJson(Map<String, dynamic> json) {
    json['id'] = id;
    json['title'] = title;
    json['year'] = year;
    json['rating'] = rating;
    json['runtime'] = runtime;
    json['genres'] = genres;
    json['large_cover_image'] = largeCoverImage;
  }


  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'];
    largeCoverImage = json['large_cover_image'];
  }
}

class Meta {
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Meta(
      {this.serverTime,
      this.serverTimezone,
      this.apiVersion,
      this.executionTime});

  Meta.fromJson(Map<String, dynamic> json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }
}
