import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class cart_appbar extends StatelessWidget {
  const cart_appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 100,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Cart",
            style: TextStyle(fontSize: 28),
          ),
        ),
      ],
    );
  }
}
