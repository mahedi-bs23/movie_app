import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/home/home_viewmodel.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class UpcomingMovies extends StatelessWidget {
  final int selectedIndex;

  const UpcomingMovies({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {

    final List<Movie> upcomingMovies = HomeViewmodel().upcomingMovies; // Access the topMovies list

    //final Movie selectedMovie = upcomingMovies[selectedIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.sp,
          height: 150.sp,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage(
                upcomingMovies[selectedIndex].image,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15).r,
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
        SizedBox(
          width: 100.sp,
          child: Text(
            overflow: TextOverflow.ellipsis,
            upcomingMovies[selectedIndex].name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        Text(
          '2023 \u2022 PG \u2022 2h 20m',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            fontSize: 8.sp,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
