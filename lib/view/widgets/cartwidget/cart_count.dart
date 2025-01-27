import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cart_count extends StatelessWidget {
  final count;
  const cart_count({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Appcolor.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          "You have $count items your cart",
          style: TextStyle(color: Colors.white),
        ));
  }
}
