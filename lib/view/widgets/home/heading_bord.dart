// import 'package:e_commerce/controller/homepage/homepagecont.dart';
import 'package:e_commerce/core/Translation/LocalLang.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class heading_bord extends GetView<LocalLang> {
  final String title;

  final String body;
  const heading_bord({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(top: 20),
            height: 150,
            decoration: BoxDecoration(
                color: Appcolor.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
              right: controller.lang.toString() == 'en' ? -20 : null,
              left: controller.lang.toString() == 'ar' ? -20 : null,
              top: -20,
              // bottom:0,
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    color: Appcolor.secondColor,
                    borderRadius: BorderRadius.circular(100)),
              ))
        ],
      ),
    );
  }
}
