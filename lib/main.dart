import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/auth/login/login_screen.dart';
import 'package:movie_app/feature/setting/setting_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDYEq7DbYmQraskbvl6L4Sgnr6SH6bsCGU',
        appId: 'id',
        messagingSenderId: 'sendid',
        projectId: 'movie-app-social-login',
        storageBucket: 'movie-app-social-login.appspot.com',
      )
  );

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
    return ScreenUtilInit(builder: (context, child) {
      return ValueListenableBuilder(valueListenable: settingViewmodel.currentTheme, builder: (context, theme, _){
        return ValueListenableBuilder(
            valueListenable: settingViewmodel.language,
            builder: (context, language, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: theme,
                home: LoginScreen(),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale.fromSubtags(languageCode: language.getLocal()),
              );
            });
      });
    });
  }
}
