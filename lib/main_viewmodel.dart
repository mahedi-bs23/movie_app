import 'package:flutter/cupertino.dart';

class MainViewmodel{
  static MainViewmodel? _instance;

  static getInstance() {
    _instance = _instance ?? MainViewmodel();
    return _instance;
  }

  ValueNotifier<Language> language = ValueNotifier(Language.english);

  void onLanguageChanged(Language language) {
    this.language.value = language;
  }
}

enum Language {
  english,
  bangla;

  String getLocal() {
    switch(this) {
      case Language.english:
        return 'en';
      case Language.bangla:
        return 'bn';
    }
  }
}