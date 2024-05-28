import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movie_list_response_model.dart';
import 'package:movie_app/data/repository/search_movie_repository.dart';
import 'package:movie_app/feature/search/model/debouncer.dart';

class SearchViewmodel {
  TextEditingController searchTextEditingController = TextEditingController();

  final ValueNotifier<List?> _suggestionList = ValueNotifier<List>([]);

  ValueListenable<List?> get suggestionList => _suggestionList;

  SearchMovieRepository searchMovieRepository = SearchMovieRepository();

  final Debouncer _debouncer = Debouncer(milliseconds: 100);

  void onSearchChanged() {
    _debouncer.run(() async {
      MovieListResponseModel movieListResponse = await searchMovieRepository
          .getSearchMovieList(searchTextEditingController.text);
      ///_suggestionList.value = [];
      _suggestionList.value = movieListResponse.data?.movies;
    });
  }

  void dispose() {

  }

}
