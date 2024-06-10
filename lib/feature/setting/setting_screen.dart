import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/setting/setting_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  SettingViewmodel settingViewmodel = SettingViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.sp, left: 16.sp, right: 16.sp, bottom: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.settings,
                  //"Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40.sp,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: settingViewmodel.isDark,
                        builder: (context, isDark, _) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 18.sp, horizontal: 16.sp),
                            child: Row(
                              children: [
                                Text(
                                  "Theme",
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Text(
                                  isDark ? "Dark Mode" : "Light Mode",
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 8.sp,
                                ),
                                Transform.scale(
                                  scaleX: 0.9,
                                  scaleY: 0.9,
                                  child: Switch(
                                    activeColor: Colors.white,
                                    activeTrackColor:
                                        Colors.greenAccent.shade700,
                                    value: isDark,
                                    onChanged: (bool value) {
                                      settingViewmodel.isDark.value = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Divider(
                        thickness: .5.sp,
                        height: 5.sp,
                        color: Colors.grey,
                      ),
                      Container(
                        padding: EdgeInsets.all(16.r),
                        child: Row(
                          children: [
                            Text(
                              "Language",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              settingViewmodel.language.value ==
                                      Language.english
                                  ? "English"
                                  : "বাংলা",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            GestureDetector(
                              onTap: () {
                                _showLanguageAlertDialog(context);
                              },
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.white60,
                                size: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: .5.sp,
                        height: 5.sp,
                        color: Colors.grey,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.sp, horizontal: 16.sp),
                        child: Row(
                          children: [
                            Text(
                              "Theme",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              "Dark Mode",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white60,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: .5.sp,
                        height: 5.sp,
                        color: Colors.grey,
                      ),
                      Container(
                        padding: EdgeInsets.all(16.r),
                        child: Row(
                          children: [
                            Text(
                              "Language",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              "none",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white60,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLanguageAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.sp, vertical: 8.sp),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            )
          ],
          title: const Text(
            "Select Language",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                trailing: settingViewmodel.language.value == Language.english
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.square_outlined),
                title: const Text(
                  'English',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  settingViewmodel.onLanguageChanged(Language.english);

                  // Handle language change
                  //Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text(
                  'বাংলা',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                trailing: settingViewmodel.language.value == Language.bangla
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.square_outlined),
                onTap: () {
                  print(Language.bangla);
                  settingViewmodel.onLanguageChanged(Language.bangla);
                  //Navigator.of(context).pop();
                },
              ),
              // Add more languages here
            ],
          ),
        );
      },
    );
  }
}
