// ignore_for_file: camel_case_types

import 'package:e_commerce/controller/onbording_controller.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/data/datasorce/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class slider extends GetView<onbordingController_impl> {
  const slider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPagechange(value);
      },
      itemCount: onbordinglist.length,
      itemBuilder: (context, index) => Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            "${onbordinglist[index].title}",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            height: 300,
            "${onbordinglist[index].image}",
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.center,
            "${onbordinglist[index].body}",
            style:
                const TextStyle(height: 2, fontSize: 17, color: Appcolor.grey),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
