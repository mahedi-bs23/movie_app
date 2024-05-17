import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/movie_list_response_model.dart';

import 'movie_repository.dart';

const String movieUrl =
    "https://asdfsdf./api/v2/list_movies.json?sort_by=popular&order_by=desc";

class MovieRepositoryImpl2 extends MovieRepository {
  @override
  Future<MovieListResponseModel> getMovieList() async {
    print("############## Before api call ##############");

    final url = Uri.parse(movieUrl);
    final response = await http.get(url);

    print("############## after api call ################");
    print(response.statusCode);

    return MovieListResponseModel.fromJson(jsonDecode(response.body));
  }
}
