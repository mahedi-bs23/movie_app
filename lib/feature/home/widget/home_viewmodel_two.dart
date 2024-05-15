


import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/get_all_movie_model.dart';
import 'package:movie_app/repository/get_all_movie_repository.dart';

class HomeViewmodelTwo {

  final ValueNotifier<bool> _isLoading = ValueNotifier(true);
  ValueNotifier<bool> get isLoading => _isLoading;



  final ValueNotifier<List?> _allMovieData = ValueNotifier(null);
  ValueNotifier<List?> get allMovieData => _allMovieData;


  Future getAllMovie() async{
    var response = await GetAllMovie().getAllMovie();

    allMovieData.value = response.data?.movies;

    print(response.status);

    if(response.status == Stat.OK){
      isLoading.value = false;
      print("Movie Data List Length: ${allMovieData.value?[0].backgroundImage}");

    }



  }


}