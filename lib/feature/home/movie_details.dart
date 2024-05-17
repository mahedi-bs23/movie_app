import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widget/elevated_button.dart';
import 'package:movie_app/feature/home/home_viewmodel_two.dart';

class MovieDetails extends StatelessWidget {
  final HomeViewmodelTwo viewmodel;

  int selectedIndex;

  MovieDetails({
    super.key,
    required this.viewmodel,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewmodel.allMovieData,
        builder: (context, movieList, _) {
          return Scaffold(
            backgroundColor: Colors.black87,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                    Container(
                      height: 200.sp,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image: NetworkImage(
                            viewmodel.allMovieData.value?[selectedIndex]
                                .largeCoverImage,
                            //viewmodel.allMovieData?[].largeCoverImage,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Text(
                      "History \u2022 Thriller \u2022 Drama \u2022 Mystery",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 8.sp,
                      ),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "${viewmodel.allMovieData.value?[selectedIndex].title}",
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
                              borderRadius: BorderRadius.circular(10).r),
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
                              borderRadius: BorderRadius.circular(10).r),
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.sp, vertical: 1.sp),
                          child: Text(
                            "${viewmodel.allMovieData.value?[selectedIndex].year}",
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
                              borderRadius: BorderRadius.circular(10).r),
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.sp, vertical: 1.sp),
                          child: Text(
                            "${viewmodel.allMovieData.value?[selectedIndex].runtime} min",
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
                        "${viewmodel.allMovieData.value?[selectedIndex].summary}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.sp,),
                    MyElevatedButton(
                      buttonText: "Add To Watchlist",
                      backgroundColor: Colors.indigoAccent.shade400,
                      buttonTextColor: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
