
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/data/model/movie_details_response_model.dart';
import 'package:movie_app/data/repository/movie_details_repository.dart';
import 'model/torrent_handler.dart';


class DetailsViewmodel {

  static DetailsViewmodel? detailsViewmodel;

  static DetailsViewmodel getInstance(){

    detailsViewmodel = detailsViewmodel ?? DetailsViewmodel();
    return detailsViewmodel!;
  }


  ValueNotifier<Movie?> movieDetailsData = ValueNotifier(null);
  ValueNotifier<bool> isLoading = ValueNotifier(true);

  Future getMovieDetails(int movieId) async {
    MovieDetailsResponseModel movieDetailsResponse =
    await MovieDetailsRepository().getMovieDetails(movieId);

    movieDetailsData.value = movieDetailsResponse.data?.movie;
    isLoading.value = false;
  }

  void onClickTorrentLaunch(String? url){
    TorrentHandler torrentOpener = TorrentHandler(torrentUrl: url!);
    torrentOpener.openTorrent();
  }





}
