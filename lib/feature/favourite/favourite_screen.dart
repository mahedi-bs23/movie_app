import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widget/add_watchlist_button.dart';
import 'package:movie_app/feature/common/app_module.dart';
import 'package:movie_app/feature/home/model/movie_model.dart';

import 'favourite_viewmodel.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteViewmodel favouriteViewmodel = FavouriteViewModelSingleton.getInstance();

    favouriteViewmodel.fetchFavouriteMovies();

    print("Watchlist in Favourite class: ${favouriteViewmodel.watchList.value.length}");
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.sp, left: 20.sp, right: 20.sp, bottom: 0),
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
                      "Favourite Movie",
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
                ValueListenableBuilder(
                  valueListenable: favouriteViewmodel.watchList,
                  builder: (context, movieList, _) {
                    return SizedBox(
                      height: 700.sp,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: movieList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 200.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10).r,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 15.sp,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
