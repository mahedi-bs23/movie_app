import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/common/app_module.dart';
import 'package:movie_app/feature/setting/setting_viewmodel.dart';
import 'package:movie_app/main_viewmodel.dart';
import 'package:movie_app/theme/theme_model.dart';
import 'package:sqflite/sqflite.dart';
import 'feature/all_screen_bottom_navigation.dart/all_screen_bottom_navigration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingViewmodel settingViewmodel = SettingViewmodel.getInstance();
    final themeModel = ThemeModel(
      lightTheme: ThemeModel.light,
      darkTheme: ThemeModel.dark,
    );
    return ScreenUtilInit(builder: (context, child) {
      return ValueListenableBuilder(valueListenable: settingViewmodel.currentTheme, builder: (context, theme, _){
        return ValueListenableBuilder(
            valueListenable: settingViewmodel.language,
            builder: (context, language, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: theme,
                home: AllScreenBottomNavigation(),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale.fromSubtags(languageCode: language.getLocal()),
              );
            });
      });
    });
  }
}
