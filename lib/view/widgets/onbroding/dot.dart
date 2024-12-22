// ignore_for_file: camel_case_types

import 'package:e_commerce/controller/onbording_controller.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/data/datasorce/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dot extends StatelessWidget {
  const dot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onbordingController_impl>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onbordinglist.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(left: 6, top: 40),
                          duration: const Duration(milliseconds: 600),
                          height: 8,
                          width: index == controller.currentpage ? 25 : 9,
                          decoration: BoxDecoration(
                              color: Appcolor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
