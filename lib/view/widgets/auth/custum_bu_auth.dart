import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custum_bu_auth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const Custum_bu_auth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          backgroundColor: Appcolor.primaryColor,
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
