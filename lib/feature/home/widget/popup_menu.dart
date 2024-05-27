import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/common/app_module.dart';
import 'package:movie_app/main_viewmodel.dart';

void showPopupMenu(
  BuildContext context,
) {
  MainViewmodel mainViewmodel = MainViewModelSingleton.getInstance();
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(200.sp, 85.sp, 0, 0),
    items: <PopupMenuEntry>[
      PopupMenuItem(
        child: const ListTile(
          title: Text('English'),
        ),
        onTap: () {mainViewmodel.onLanguageChanged(Language.english);},
      ),
      PopupMenuItem(
        child: const ListTile(
          title: Text('বাংলা'),
        ),
        onTap: () {mainViewmodel.onLanguageChanged(Language.bangla);},
      ),
    ],
  );
}
