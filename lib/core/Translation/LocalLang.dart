// ignore_for_file: file_names, unnecessary_import

import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/constant/theme_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalLang extends GetxController {
  Locale lang = Locale("en");
  Myservicese myservicese = Get.put(Myservicese());
  ThemeData apptheme = English_theme;
//
//   changlocal(String langcode) {
//     Locale locale = Locale(langcode);
//     myservicese.sharedPreferences.setString("lan", langcode);
//     apptheme = langcode == "en" ? English_theme : Arabic_theme;
//     Get.changeTheme(apptheme);
//     Get.updateLocale(locale);
//   }

  @override
  void onInit() {
    lang = const Locale("en");
    myservicese.sharedPreferences.setString("lan", "as");
    var sharePref = myservicese.sharedPreferences.getString("lan");
    if (sharePref == "en") {
      lang = const Locale("en");
      apptheme = English_theme;
    } else if (sharePref == "ar") {
      lang = const Locale("en");
      apptheme = Arabic_theme;
    } else {
      lang = const Locale("en");
      // lang = Locale(Get.deviceLocale!.languageCode) == const Locale("en")
      //     ? const Locale("en")
      //     : const Locale("ar");

      apptheme = lang == const Locale("en") ? English_theme : Arabic_theme;
    }
    super.onInit();
  }
}
