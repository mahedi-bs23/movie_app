import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/movie_list_response_model.dart';




class  SearchMovieRepository {
  Future<MovieListResponseModel> getSearchMovieList(String query) async {
    print("############## Before api call ##############");

    final url = Uri.parse('https://yts.mx/api/v2/list_movies.json?query_term=$query');
    final response = await http.get(url);

    print("############## after api call ################");
    print(response.statusCode);

    if (response.statusCode == 200) {
      return MovieListResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load suggestions');
    }
  }
}
