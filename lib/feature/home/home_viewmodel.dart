import 'package:flutter/cupertino.dart';
import 'package:movie_app/feature/home/home_screen.dart';
import 'package:movie_app/feature/menu/menu_screen.dart';
import 'package:movie_app/feature/search/search_screen.dart';
import 'package:movie_app/feature/setting/setting_screen.dart';

class HomeViewmodel {


  //final int currentScreenIndex = 0;

  final ValueNotifier<int> currentScreenIndex = ValueNotifier(0);

  List<Widget> screen = <Widget>[
    HomeScreen(),
    SearchScreen(),
    MenuScreen(),
    SettingScreen(),
  ];
}
