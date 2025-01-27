// ignore_for_file: file_names, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:e_commerce/view/screen/favorite.dart';
import 'package:e_commerce/view/screen/homepage.dart';
import 'package:e_commerce/view/screen/profile.dart';
import 'package:e_commerce/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Homescreencont extends GetxController {
  changepage(int i);
  int currentpage = 0;
}

class Homescreencontim extends Homescreencont {
  List<Widget> list_pages = [
    const Homepage(),
    const Profile(),
    const Favorite(),
    const Setting()
  ];
  List icons = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.favorite_border
  ];
  List name = ["home", "Setting", "Profile", "Favorite"];

  @override
  changepage(int i) {
    currentpage = i;
    update();
  }
}
