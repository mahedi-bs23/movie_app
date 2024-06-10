import 'package:movie_app/data/local/new_local_data_source.dart';
import 'package:movie_app/data/model/movie_list_response_model.dart';
import 'package:movie_app/data/remote/api_client.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    SharedPreferences pref = await SharedPreferences.getInstance();
    const String lastCallTimeKey = 'lastCallTime';

    int? lastCallTime = pref.getInt(lastCallTimeKey);

    final currentCallTime = DateTime.now().hour;

    print("Current Call Time: ${DateTime.now().hour}hr:${DateTime.now().minute}min:${DateTime.now().second}sec");
    print("Last Call Time: $lastCallTime hr");

    if (data.isEmpty ||
        lastCallTime == null || currentCallTime <= lastCallTime ||
        (currentCallTime - lastCallTime >= 1)) {

      MovieListResponseModel responseModel = await apiClient.getMovieList();
      final List<MovieModel>? remoteData = responseModel.data?.movies
          ?.map((e) => MovieModel.fromMovies(e))
          .toList();

      ///print("Sending from remote data11 ${remoteData?.length}");
      if (remoteData != null) {
        localDataSource.deleteAllMovieFromTable();
        localDataSource.insertMovieData(remoteData);
        await pref.setInt(lastCallTimeKey, currentCallTime);
        ///print("Sending from remote data2222 ${remoteData.length}");
        yield remoteData;
      }
    }
  }
}
