// ignore_for_file: file_names, unnecessary_import

import 'package:e_commerce/controller/homepage/Homescreencon.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/view/widgets/home/bottomAppBar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homescreencontim());
    return GetBuilder<Homescreencontim>(
      builder: (controller) => Scaffold(
          // backgroundColor: Colors.red,

          floatingActionButton: FloatingActionButton(
            heroTag: "next1",
            backgroundColor: Appcolor.primaryColor,
            shape: const CircleBorder(),
            onPressed: () {},
            child: const Icon(
              Icons.shopping_basket_outlined,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const bottomAppBar(),
          body: controller.list_pages.elementAt(controller.currentpage)),
    );
  }
}
