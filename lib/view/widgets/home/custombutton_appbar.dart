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
      minWidth: 12,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? Appcolor.primaryColor : Colors.grey,
          ),
          Text(
            text,
            style: TextStyle(
                color: active == true ? Appcolor.primaryColor : Colors.grey),
          )
        ],
      ),
    );
  }
}
