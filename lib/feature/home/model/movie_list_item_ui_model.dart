import 'package:movie_app/data/model/movie_list_response_model.dart';

class MovieListItemUiModel {
  String? backgroundUrl;
  String? name;

  MovieListItemUiModel({
    this.backgroundUrl,
    this.name,
  });

  factory MovieListItemUiModel.fromMovieResponse(Movie movie) {
    return MovieListItemUiModel(
      backgroundUrl:  movie.backgroundImage,
    );
  }
}
