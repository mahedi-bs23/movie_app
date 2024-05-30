
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/movie_details_response_model.dart';
import 'package:movie_app/data/model/movie_list_response_model.dart';

class MovieDetailsRepository {


  Future<MovieDetailsResponseModel> getMovieDetails(int movieId) async{
    print("Movie Id in repo: $movieId");
    final url = Uri.parse('https://yts.mx/api/v2/movie_details.json?movie_id=$movieId&with_images=true&with_cast=true');
    final response = await http.get(url);


    if(response.statusCode==200){

      return MovieDetailsResponseModel.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('No Data Available');
    }


  }



}