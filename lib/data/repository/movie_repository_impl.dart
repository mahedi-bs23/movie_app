import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/local/new_local_data_source.dart';
import 'package:movie_app/data/model/movie_list_response_model.dart';
import 'package:movie_app/data/remote/api_client.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:movie_app/movie%20details/details_screen.dart';

import 'movie_repository.dart';


class MovieRepositoryImpl extends MovieRepository {
  ApiClient apiClient;
  NewLocalDataSource localDataSource;

  MovieRepositoryImpl({required this.apiClient, required this.localDataSource});

  @override
  Stream<List<MovieModel?>> getMovieList() async* {
      final data = await localDataSource.getMovieData();
      yield data;
      print("Sending from local data ${data.length}");
      MovieListResponseModel responseModel = await apiClient.getMovieList();

      if(data.isNotEmpty) {
        final List<MovieModel>? remoteData = responseModel.data?.movies?.map((e) => MovieModel.fromMovies(e)).toList();

        if(remoteData != null) {
          localDataSource.insertMovieData(remoteData);
          print("Sending from remote data ${remoteData.length}");
          yield remoteData;
        }
      }

  }
}


