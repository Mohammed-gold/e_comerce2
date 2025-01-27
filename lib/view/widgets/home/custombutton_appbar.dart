// ignore_for_file: camel_case_types

import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';

class custombutton_appbar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String text;
  final bool active;
  const custombutton_appbar({
    super.key,
    required this.text,
    this.onPressed,
    required this.active,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: 2,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            size: 20,
            icon,
            color: active == true
                ? Appcolor.primaryColor
                : const Color.fromARGB(200, 41, 40, 40),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                color: active == true ? Appcolor.primaryColor : Colors.black),
          )
        ],
      ),
    );
  }
}
