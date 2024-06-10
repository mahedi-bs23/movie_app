import 'package:flutter/cupertino.dart';

class SettingViewmodel {


  static SettingViewmodel? _instance;

  static getInstance() {
    _instance = _instance ?? SettingViewmodel();
    return _instance;
  }


  ValueNotifier<bool> isDark = ValueNotifier(true);
  ValueNotifier<Language> language = ValueNotifier(Language.english);

  void onLanguageChanged(Language language) {
    this.language.value = language;
    print(this.language.value);

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