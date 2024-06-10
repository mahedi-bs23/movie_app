
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  void init(){
     movieDetailsData.value = null;
    _isLoading.value = true;
  }




  ValueListenable<bool> get isLoading => _isLoading;

  Future getMovieDetails(int movieId) async {
    MovieDetailsResponseModel movieDetailsResponse =
    await MovieDetailsRepository().getMovieDetails(movieId);


    movieDetailsData.value = movieDetailsResponse.data?.movie;
    _isLoading.value = false;
  }

  void onClickTorrentLaunch(String? url){
    TorrentHandler torrentOpener = TorrentHandler(torrentUrl: url!);
    torrentOpener.openTorrent();
  }





}
