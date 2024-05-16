import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widget/add_watchlist_button.dart';
import 'package:movie_app/feature/home/home_viewmodel.dart';
import 'package:movie_app/feature/home/model/movie_list_category.dart';

class SeeAllMovies extends StatelessWidget {
  final MovieListCategory movieListCategory;

  HomeViewmodel viewmodel = HomeViewmodel();

  SeeAllMovies({
    super.key,
    required this.movieListCategory,
  }) {
    viewmodel.onInit(movieListCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                      "title",
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
                SizedBox(
                  height: 700.sp,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: viewmodel.movieList.value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150.sp,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      viewmodel.movieList.value[index].image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.sp, horizontal: 16.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "History \u2022 Thriller \u2022 Drama \u2022 Mystery",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.sp,
                                    ),
                                    Text(
                                      viewmodel.movieList.value[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.sp,
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
                                            "PG 13",
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
                                            viewmodel.movieList.value[index]
                                                .releaseYear,
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
                                            viewmodel
                                                .movieList.value[index].time,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 6.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.yellow.shade700,
                                          size: 20.sp,
                                        ),
                                        SizedBox(
                                          width: 2.sp,
                                        ),
                                        Text(
                                          viewmodel
                                              .movieList.value[index].rating,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          height: 25.sp,
                                          width: 100,
                                          child: AddWatchlistButton(
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15.sp,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
