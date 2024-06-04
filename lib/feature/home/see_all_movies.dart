import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/home/model/movie_list_category.dart';

class SeeAllMovies extends StatelessWidget {
  final MovieListCategory movieListCategory;


  SeeAllMovies({
    super.key,
    required this.movieListCategory,
  }) {
    //viewmodel.onInit(movieListCategory);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
