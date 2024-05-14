import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widget/add_watchlist_button.dart';
import 'package:movie_app/feature/home/home_viewmodel.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class SpecialMovies extends StatelessWidget {
  SpecialMovies({super.key});

  final ValueNotifier<int> currentPageNotifier = ValueNotifier(0);
  final int pageCount = 5; // Replace with the actual number of pages
  late PageController _pageController;
  late Timer _timer;

  void _startAutoPageChange() {
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        final nextPage = (currentPageNotifier.value + 1) % HomeViewmodel().specialMovies.length;
        _pageController.animateToPage(nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: currentPageNotifier.value);
    _startAutoPageChange();

    final List<Movie> specialMovies =
        HomeViewmodel().specialMovies; // Access the topMovies list

    return ValueListenableBuilder(
      valueListenable: currentPageNotifier,
      builder: (context, currentPage, _) {
        return PageView.builder(
          pageSnapping: true,
          itemCount: specialMovies.length,
          controller: _pageController,
          onPageChanged: (index) {
            currentPageNotifier.value = index; // Update the current page index
          },
          itemBuilder: (context, pagePosition) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 220.sp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        specialMovies[pagePosition].image,
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(15).r,
                  ),
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
                              specialMovies[pagePosition].rating,
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
                      Text(
                        specialMovies[pagePosition].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 16.sp,
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
                                borderRadius: BorderRadius.circular(10).r),
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
                                borderRadius: BorderRadius.circular(10).r),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.sp, vertical: 1.sp),
                            child: Text(
                              specialMovies[pagePosition].releaseYear,
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
                                borderRadius: BorderRadius.circular(10).r),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.sp, vertical: 1.sp),
                            child: Text(
                              specialMovies[pagePosition].time,
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
                      onPressed: () {},
                    ),
                  ),
                ),

                ///  Sliding Pointer List ///

                Positioned(
                  left: 220.sp,
                  //right: 20.sp,
                  bottom: 10.sp,
                  child: SizedBox(
                    height: 4.sp,
                    width: 50.sp,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: specialMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: index == pagePosition ? 20.sp : 4.sp,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 3.sp,
                        );
                      },
                    ),
                  ),
                ),
              ],
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
