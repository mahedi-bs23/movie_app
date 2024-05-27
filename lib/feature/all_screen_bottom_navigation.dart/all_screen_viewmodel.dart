import 'package:flutter/material.dart';
import 'package:movie_app/feature/all_screen_bottom_navigation.dart/model/navigation_item_model.dart';
import 'package:movie_app/feature/all_screen_bottom_navigation.dart/model/navigation_item_type.dart';

class AllScreenViewModel {

  static AllScreenViewModel? _instance;

  static getInstance() {
    _instance = _instance ?? AllScreenViewModel();
    return _instance;
  }


  ValueNotifier<NavigationItemType> selectedNavigationMenu =
      ValueNotifier(NavigationItemType.home);

  List<NavigationItemModel> bottomNavigationItems = [
    NavigationItemModel(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: "",
      navigationItemType: NavigationItemType.home,
    ),
    NavigationItemModel(
      icon: Icons.search,
      selectedIcon: Icons.search,
      label: "",
      navigationItemType: NavigationItemType.search,
    ),
    NavigationItemModel(
      icon: Icons.format_list_bulleted,
      selectedIcon: Icons.format_list_bulleted,
      label: "",
      navigationItemType: NavigationItemType.favourite,
    ),
    NavigationItemModel(
      icon: Icons.settings,
      selectedIcon: Icons.settings,
      label: "",
      navigationItemType: NavigationItemType.settings,
    ),
  ];

  void onChangedSelectedNavigation(int index) {
    print(bottomNavigationItems[index].navigationItemType);
    selectedNavigationMenu.value = bottomNavigationItems[index].navigationItemType;
  }
}
