import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';

class Titlewedegt extends StatelessWidget {
  final String title;
  const Titlewedegt({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
              color: Appcolor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }
}
