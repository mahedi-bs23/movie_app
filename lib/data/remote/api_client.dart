import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/movie_list_response_model.dart';

const String movieUrl =
    "https://yts.mx/api/v2/list_movies.json?";

class ApiClient {
  @override
  Future<MovieListResponseModel> getMovieList() async {
    print("############## Before api call ##############");

    final url = Uri.parse(movieUrl);
    final response = await http.get(url);

    print("############## after api call ################");
    print("Status code repo class : ${response.statusCode}");

    return MovieListResponseModel.fromJson(jsonDecode(response.body));
  }
}


