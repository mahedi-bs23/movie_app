import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';
import 'package:movie_app/feature/home/widget/special_movies.dart';
import 'package:movie_app/feature/home/widget/top_movies.dart';
import 'package:movie_app/feature/home/widget/upcoming_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Movie Hub',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.square_outlined,
                      color: Colors.white,
                      size: 24.sp,
                    )
                  ],
                ),
                SizedBox(
                  height: 16.sp,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 220.sp,
                  child: const SpecialMovies(),
                ),
                SizedBox(
                  height: 24.sp,
                ),
                Row(
                  children: [
                    Text(
                      'Top Movie Picks',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.sp,
                ),
                SizedBox(
                  height: 200.sp,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: topMovies.length,
                    itemBuilder: (context, index) {
                      return TopMovies(
                        selectedIndex: index,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15.sp,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Row(
                  children: [
                    Text(
                      'Upcoming Movies',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.sp,
                ),
                SizedBox(
                  height: 200.sp,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: topMovies.length,
                    itemBuilder: (context, index) {
                      return UpcomingMovies(
                        selectedIndex: index,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15.sp,
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

///filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity as needed
