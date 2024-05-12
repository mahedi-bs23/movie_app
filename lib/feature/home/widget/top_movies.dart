import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

class TopMovies extends StatelessWidget {

  final int selectedIndex;
  const TopMovies({
    super.key,
    required this.selectedIndex

  });

  @override
  Widget build(BuildContext context) {
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
                topMovies[selectedIndex].image,
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
            topMovies[selectedIndex].name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        Text(
          '2023 * PG * 2h 20m',
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
