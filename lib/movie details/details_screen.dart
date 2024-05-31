import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widget/elevated_button.dart';
import 'package:movie_app/feature/common/app_module.dart';
import 'package:movie_app/feature/favourite/favourite_viewmodel.dart';
import 'package:movie_app/feature/favourite/model/favourite_movie_model.dart';
import 'package:movie_app/movie%20details/details_screen_shimmer.dart';
import 'package:movie_app/movie%20details/details_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieDetails extends StatelessWidget {
  int movieId;

  MovieDetails({
    super.key,
    required this.movieId,
  });

  final detailsViewmodel = DetailsViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    print("Movie Id in details page: $movieId");
    FavouriteViewmodel favouriteViewmodel =
        FavouriteViewModelSingleton.getInstance();

    detailsViewmodel.init();
    detailsViewmodel.getMovieDetails(movieId);

    return ValueListenableBuilder(
        valueListenable: detailsViewmodel.movieDetailsData,
        builder: (context, movieList, _) {
          return Scaffold(
            backgroundColor: Colors.black87,
            body: detailsViewmodel.isLoading.value
                ? const DetailsScreenShimmerLoading()
                : SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20).r,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16.sp,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 25.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.sp,
                                ),
                                Text(
                                  "Movie Details",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.sp,
                            ),
                            movieList?.largeCoverImage == null
                                ? Container(
                                    height: 200.sp,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  )
                                : Container(
                                    height: 200.sp,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.circular(10.r),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          movieList?.largeCoverImage
                                                  .toString() ??
                                              "",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        detailsViewmodel.onClickTorrentLaunch(
                                          "https://yts.mx/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2",
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(10).r),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Download ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Icon(
                                              Icons.file_download_outlined,
                                              color: Colors.white,
                                              size: 32.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 8.sp,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 20.sp,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: movieList?.genres?.length ?? 4,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(
                                    movieList?.genres?[index] ?? "null",
                                    //"History \u2022 Thriller \u2022 Drama \u2022 Mystery",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Text(
                                    " \u2022 ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 8.sp,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "${movieList?.title}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.sp,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.sp,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10).r),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.sp, vertical: 1.sp),
                                  child: Text(
                                    "17+",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
                                        width: 1.sp,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10).r),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.sp, vertical: 1.sp),
                                  child: Text(
                                    "${movieList?.year}",
                                    //"specialMovies[pagePosition].releaseYear ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 8.sp,
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
                                        width: 1.sp,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10).r),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.sp, vertical: 1.sp),
                                  child: Text(
                                    "${movieList?.runtime} min",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.sp,
                            ),
                            SizedBox(
                              width: 300.sp,
                              child: Text(
                                "${movieList?.descriptionIntro.toString()}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.sp,
                            ),
                            MyElevatedButton(
                              buttonText:
                                  AppLocalizations.of(context)!.add_to_favorite,
                              backgroundColor: Colors.indigoAccent.shade400,
                              buttonTextColor: Colors.white,
                              onPressed: () {
                                favouriteViewmodel.onClickAddToFavourite(
                                  FavouriteMovieModel(
                                    name: movieList?.title ?? "",
                                    image: movieList?.largeCoverImage ?? "",
                                    releaseYear:
                                        movieList?.year.toString() ?? "",
                                    runtime:
                                        movieList?.runtime.toString() ?? "",
                                    rating: movieList?.rating.toString() ?? " ",
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 12.sp,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Overall Rating",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "${movieList?.rating.toString() ?? 1}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RatingBar.builder(
                                      initialRating:
                                          movieList?.rating.toDouble() / 2.0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 16.sp,
                                      unratedColor: Colors.white,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                        size: 10.sp,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 80.sp,
                                  width: 2.sp,
                                  color: Colors.white,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Your Rating",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "0.0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 0.0,
                                      minRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 16.sp,
                                      unratedColor: Colors.white,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                        size: 10.sp,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.sp,
                            ),
                            Text(
                              "Cast \u2022 Writer \u2022 Director",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(
                              height: 100.sp,
                              width: double.infinity,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: movieList?.cast?.length ?? 5,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70.sp,
                                        width: 70.sp,
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              movieList?.cast?[index]
                                                      .urlSmallImage ??
                                                  " ",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        movieList?.cast?[index].name
                                                .toString() ??
                                            "no data",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        movieList?.cast?[index].characterName
                                                .toString() ??
                                            "no data",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 5.sp,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}
