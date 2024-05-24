import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widget/add_watchlist_button.dart';
import 'package:movie_app/data/local/local_data_source.dart';
import 'package:movie_app/feature/common/app_module.dart';
import 'package:movie_app/feature/favourite/favourite_viewmodel.dart';
import 'package:movie_app/feature/favourite/model/favourite_movie_model.dart';
import 'package:movie_app/feature/home/home_viewmodel_two.dart';
import 'package:movie_app/movie%20details/details_screen.dart';

class SpecialMovies extends StatelessWidget {
  final HomeViewmodelTwo viewModelTow;

  SpecialMovies({
    super.key,
    required this.viewModelTow,
  });

  final ValueNotifier<int> currentPageNotifier = ValueNotifier(0);
  final int pageCount = 10; // Replace with the actual number of pages
  late PageController _pageController;
  late Timer _timer;

  /*void _startAutoPageChange() {
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        final nextPage = (currentPageNotifier.value + 1) % 10;
        _pageController.animateToPage(nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      },
    );
  }*/

  FavouriteViewmodel favouriteViewmodel =
      FavouriteViewModelSingleton.getInstance();
  LocalDataSource localDataSource = LocalDataSourceSingleton.getInstance();

  @override
  Widget build(BuildContext context) {
    /* _pageController = PageController(initialPage: currentPageNotifier.value);
    _startAutoPageChange();*/

    /*final List<Movie> specialMovies =
        HomeViewmodel().specialMovies;*/

    void showToast(BuildContext context, String contentText, bool isAdded) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          backgroundColor: isAdded ? Colors.red : Colors.white,
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 700, left: 20, right: 20),
          content: Text(
            contentText,

            ///'Already added into favourite movie',
            style: TextStyle(
                color: isAdded ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
    }

    return ValueListenableBuilder(
      valueListenable: currentPageNotifier,
      builder: (context, currentPage, _) {
        return ValueListenableBuilder(
          valueListenable: viewModelTow.allMovieData,
          builder: (context, movieList, _) {
            return PageView.builder(
              // controller: _pageController,
              pageSnapping: true,
              itemCount: viewModelTow.allMovieData.value!.length.toInt(),

              ///controller: _pageController,
              onPageChanged: (index) {
                currentPageNotifier.value =
                    index; // Update the current page index
              },
              itemBuilder: (context, pagePosition) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetails(
                          movieId: movieList?[pagePosition].id,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: viewModelTow.allMovieData,
                        builder: (context, allMovieDataList, _) {
                          ///debugPrint("============================== $url =============");
                          if (movieList?[pagePosition].largeCoverImage == "") {
                            return const SizedBox.shrink();
                          }
                          return Container(
                            width: double.infinity,
                            height: 220.sp,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  movieList?[pagePosition].largeCoverImage,
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(15).r,
                            ),
                          );
                        },
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: ClipRect(
                          // Clip the filter to half
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                            // Adjust blur intensity as needed
                            child: Container(
                              height: 70.sp,
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  bottomRight: Radius.circular(15.r),
                                ),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white38,
                                    width: .5.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 20.sp,
                        top: 20.sp,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.sp,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(4).r,
                                border: Border.all(
                                  color: Colors.white,
                                  width: .5.sp,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.white,
                                    size: 16.sp,
                                  ),
                                  SizedBox(
                                    width: 2.sp,
                                  ),
                                  Text(
                                    "${viewModelTow.allMovieData.value?[pagePosition].rating}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 20.sp,
                        top: 155.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.sp,
                              child: Text(
                                "${viewModelTow.allMovieData.value?[pagePosition].title}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Text(
                              "History Thriller Drama Mystery",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 8.sp,
                              ),
                            ),
                            SizedBox(
                              height: 6.sp,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: .5.sp,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10).r),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.sp, vertical: 1.sp),
                                  child: Text(
                                    "17+",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.sp,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: .5.sp,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10).r),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.sp, vertical: 1.sp),
                                  child: Text(
                                    "${viewModelTow.allMovieData.value?[pagePosition].year}",
                                    //"specialMovies[pagePosition].releaseYear ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.sp,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: .5.sp,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10).r),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.sp, vertical: 1.sp),
                                  child: Text(
                                    "${viewModelTow.allMovieData.value?[pagePosition].runtime} min",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 170.sp,
                        left: 220.sp,
                        right: 20.sp,
                        child: SizedBox(
                          height: 20.h,
                          width: 80.w,
                          child: AddWatchlistButton(
                            buttonText: "Add To Watchlist",
                            onPressed: () async {
                              bool isPresent = await favouriteViewmodel
                                  .onClickAddToFavourite(
                                FavouriteMovieModel(
                                  name: movieList?[pagePosition].title,
                                  image:
                                      movieList?[pagePosition].largeCoverImage,
                                  releaseYear: movieList?[pagePosition]
                                          .year
                                          .toString() ??
                                      "",
                                  runtime: movieList?[pagePosition]
                                          .runtime
                                          .toString() ??
                                      "",
                                  rating: movieList?[pagePosition]
                                          .rating
                                          .toString() ??
                                      " ",
                                ),
                              );

                              print("Add Special Movie in Fav: $isPresent");
                              if (isPresent == false) {
                                showToast(context,
                                    "Already added into favourite movie", true);
                              } else {
                                showToast(context, "Added into favourite movie",
                                    false);
                              }

                              print(
                                  "WatchList Length In Special Movie Class: ${favouriteViewmodel.watchList.value.length}");
                            },
                          ),
                        ),
                      ),

                      ///  Sliding Pointer List ///

                      Positioned(
                        left: 150.sp,
                        //right: 20.sp,
                        bottom: 10.sp,
                        child: SizedBox(
                          height: 4.sp,
                          width: 180.sp,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModelTow.allMovieData.value?.length
                                    .toInt() ??
                                20,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: index == pagePosition ? 20.sp : 4.sp,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 3.sp,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void dispose() {
    _timer.cancel();
    _pageController.dispose();
  }
}
