import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/home/home_viewmodel.dart';

class AllScreenBottomNavigation extends StatelessWidget {
  AllScreenBottomNavigation({super.key});

  HomeViewmodel homeViewmodel = HomeViewmodel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: homeViewmodel.currentScreenIndex,
      builder: (context, currentScreenIndex, _) {
        return Scaffold(
          body: Container(
            child: homeViewmodel.screen[homeViewmodel.currentScreenIndex.value],
          ),
          bottomNavigationBar: SizedBox(
            height: 60.sp,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              currentIndex: currentScreenIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white38,
              //showUnselectedLabels: true,
              //showSelectedLabels: true,
              selectedIconTheme: IconThemeData(
                size: 25.sp,
              ),
              unselectedIconTheme: IconThemeData(
                size: 25.sp,
              ),

              unselectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              selectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              onTap: (index) {
                if (kDebugMode) {
                  print(
                    homeViewmodel.currentScreenIndex.value,
                  );
                }
                homeViewmodel.currentScreenIndex.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "",
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded),
                  activeIcon: Icon(Icons.search_rounded),
                  label: "",
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.view_list_rounded),
                  activeIcon: Icon(Icons.view_list_rounded),
                  label: "",
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    activeIcon: Icon(Icons.settings),
                    label: "",
                    backgroundColor: Colors.black),
              ],
            ),
          ),
        );
      },
    );
  }
}
