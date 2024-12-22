// ignore_for_file: camel_case_types

import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/data/datasorce/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPagechange(int ch);
}

class onbordingController_impl extends OnBordingController {
  int currentpage = 0;
  late PageController pageController;
  Myservicese service = Get.find();

  @override
  next() {
    currentpage++;
    if (currentpage > onbordinglist.length - 1) {
      service.sharedPreferences.setString("step", "1");
      Get.offAllNamed(App_root.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  onPagechange(ch) {
    currentpage = ch;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
