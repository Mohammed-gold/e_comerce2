// ignore_for_file: file_names, unnecessary_import, camel_case_types

import 'package:e_commerce/controller/onbording_controller.dart';
import 'package:e_commerce/view/widgets/onbroding/coustomonbord_bu.dart';
import 'package:e_commerce/view/widgets/onbroding/dot.dart';
import 'package:e_commerce/view/widgets/onbroding/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class onBording extends StatelessWidget {
  const onBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onbordingController_impl());
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          child: slider(),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                dot(),
                Spacer(
                  flex: 1,
                ),
                CoustomOnbord_Bu(),
                Spacer(
                  flex: 1,
                ),
              ],
            ))
      ],
    )));
  }
}
