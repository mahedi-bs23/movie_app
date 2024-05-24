import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/movie%20details/details_screen.dart';
import 'package:movie_app/feature/search/search_viewmodel.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchViewmodel searchViewmodel = SearchViewmodel();

  @override
  Widget build(BuildContext context) {
    searchViewmodel.searchTextEditingController
        .addListener(searchViewmodel.onSearchChanged);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onTap: (){
          print("Clicked");
          FocusScope.of(context).unfocus();

        },
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 20.sp, left: 16.sp, right: 16.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Search.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
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
                    child: TextFormField(
                      controller: searchViewmodel.searchTextEditingController,
                      style: const TextStyle(color: Colors.white54),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.white54,
                        hintText: "Search...",
                        hintStyle: const TextStyle(
                          color: Colors.white60,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).r,
                          borderSide: BorderSide(
                            width: 1.r,
                            color: Colors.white60,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30).r,
                          borderSide: BorderSide(
                            width: 1.r,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: searchViewmodel.suggestionList,
                      builder: (context, suggestionList, _) {
                        if (suggestionList!.isEmpty) {
                          return const Center(
                            child: Text(
                              "No movie is found.",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: suggestionList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(

                              onTap: () {
                                print(suggestionList[index].id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetails(
                                        movieId: suggestionList[index].id),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 50.sp,
                                child: ListTile(
                                  title: Text(
                                    suggestionList[index].title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
