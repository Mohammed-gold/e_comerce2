// ignore_for_file: file_names

import 'package:e_commerce/core/constant/images.dart';
import 'package:flutter/material.dart';

class LogImg extends StatelessWidget {
  const LogImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 113.0),
      child: Container(
        height: 130,
        width: 60,
        decoration: BoxDecoration(
            // color: Colors.green,
            borderRadius: BorderRadius.circular(800),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(images.logo))),
        // child: Image.asset(images.logo),
      ),
    );
  }
}
