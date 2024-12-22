// ignore_for_file: camel_case_types

import 'package:e_commerce/controller/onbording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Appcolor.dart';

class CoustomOnbord_Bu extends GetView<onbordingController_impl> {
  const CoustomOnbord_Bu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Appcolor.primaryColor,
      ),
      onPressed: () {
        controller.next();
      },
      child: Text(
        "8".tr,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
