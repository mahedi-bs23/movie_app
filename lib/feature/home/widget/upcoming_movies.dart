import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/home/home_viewmodel_two.dart';
import 'package:movie_app/movie%20details/details_screen.dart';

class UpcomingMovies extends StatelessWidget {
  final int selectedIndex;
  final HomeViewmodelTwo homeViewmodelTwo;

  const UpcomingMovies(
      {super.key, required this.selectedIndex, required this.homeViewmodelTwo});

  @override
  Widget build(BuildContext context) {


    return ValueListenableBuilder(
        valueListenable: homeViewmodelTwo.localMovieData,
        builder: (context, movieList, _) {
          return GestureDetector(
            onTap: () {
              print(movieList?[selectedIndex]?.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(
                      movieId: movieList[selectedIndex]?.id ?? 100),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.sp,
                  height: 150.sp,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    image: DecorationImage(
                      image: NetworkImage(
                        movieList?[selectedIndex]?.image ?? " ",
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
                    movieList[selectedIndex]?.title ?? "no data",
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
            ),
          );
        });
  }
}
