import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/all_screen_bottom_navigation.dart/all_screen_viewmodel.dart';
import 'package:movie_app/feature/all_screen_bottom_navigation.dart/model/navigation_item_type.dart';

class AllScreenBottomNavigation extends StatelessWidget {
  AllScreenBottomNavigation({super.key});

  AllScreenViewModel viewModel = AllScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<NavigationItemType>(
      valueListenable: viewModel.selectedNavigationMenu,
      builder: (context, value, _) {
        return Scaffold(
          body: Container(
            child: value.getView(),
          ),
          bottomNavigationBar: Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 8.sp),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: NavigationItemType.values.indexOf(value),
              backgroundColor: Colors.black,
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
                viewModel.onChangedSelectedNavigation(index);
              },
              items: viewModel.bottomNavigationItems
                  .map((e) => e.getNavigationIconView())
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
