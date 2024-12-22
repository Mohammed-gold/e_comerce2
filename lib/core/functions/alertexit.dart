import 'dart:io';

import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExit() {
  Get.defaultDialog(title: "43".tr, content: Text("46".tr), actions: [
    ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Appcolor.primaryColor),
        onPressed: () {
          exit(0);
        },
        child: Text(
          "44".tr,
          style: const TextStyle(color: Colors.white),
        )),
    ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Appcolor.primaryColor),
        onPressed: () {
          Get.back();
        },
        child: Text(
          "45".tr,
          style: const TextStyle(color: Colors.white),
        ))
  ]);
  return Future.value(true);
}
