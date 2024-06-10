import 'package:flutter/material.dart';
import 'package:movie_app/theme/theme_model.dart';

class SettingViewmodel {
  static SettingViewmodel? _instance;

  static SettingViewmodel getInstance() {
    _instance ??= SettingViewmodel._internal();
    return _instance!;
  }

  final ThemeModel themeModel = ThemeModel(
    lightTheme: ThemeModel.light,
    darkTheme: ThemeModel.dark,
  );

  ValueNotifier<Language> language = ValueNotifier(Language.english);
  ValueNotifier<bool> isDark = ValueNotifier(true);
  late ValueNotifier<ThemeData> currentTheme;

  SettingViewmodel._internal() {
    currentTheme = ValueNotifier(themeModel.darkTheme);
  }

  void onThemeChange() {
    isDark.value = !isDark.value;
    currentTheme.value = isDark.value ? themeModel.darkTheme : themeModel.lightTheme;
    print(currentTheme);
    print("isDark ${isDark.value}");
  }

  void onLanguageChanged(Language newLanguage) {
    language.value = newLanguage;
    print(language.value.getLocal());
  }
}

enum Language {
  english,
  bangla;

  String getLocal() {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.bangla:
        return 'bn';
    }
  }
}
