import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/feature/all_screen_bottom_navigation.dart/model/navigation_item_type.dart';

class NavigationItemModel {
  String? label;
  IconData? icon;
  IconData? selectedIcon;
  NavigationItemType navigationItemType;

  NavigationItemModel({
    this.label,
    this.icon,
    this.selectedIcon,
    required this.navigationItemType,
  });

  BottomNavigationBarItem getNavigationIconView() {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(selectedIcon),
      label: label,
    );
  }
}
