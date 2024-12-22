// ignore_for_file: unnecessary_import, camel_case_types, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class auth_Text_form extends StatelessWidget {
  final String Hint;
  final bool? secure;
  final IconData icon;
  final String lable;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final void Function()? onTapshowicon;
  final TextInputType? keyboardType;

  auth_Text_form(
      {super.key,
      required this.Hint,
      required this.icon,
      required this.lable,
      required this.textEditingController,
      this.secure,
      this.validator,
      this.onTapshowicon,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        validator: validator,
        obscureText: secure == null || secure == false ? false : true,
        controller: textEditingController,
        textAlign: TextAlign.start,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(27)),
          suffixIcon: InkWell(
            onTap: onTapshowicon,
            child: Icon(
              icon,
              color: secure == false ? Appcolor.primaryColor : Appcolor.grey,
            ),
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Text(
              lable,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Appcolor.primaryColor,
                width: 2,
              )),
          focusColor: Appcolor.primaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelStyle: const TextStyle(letterSpacing: 4),
          labelStyle: const TextStyle(
            letterSpacing: 3,
          ),
          hintStyle: const TextStyle(
            letterSpacing: 2,
            color: Colors.grey,
            height: 1,
          ),
          hintText: Hint,
        ),
      ),
    );
  }
}
