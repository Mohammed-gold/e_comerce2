import 'package:e_commerce/core/Translation/LocalLang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

translatedatabase(String ar, en) {
  LocalLang lang = Get.find();
  if (lang.lang == const Locale("en")) {
    return en;
  } else if (lang.lang == const Locale("ar")) {
    return ar;
  }
}
