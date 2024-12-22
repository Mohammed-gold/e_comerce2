import 'package:e_commerce/controller/auth/veryfiycontrollersignup.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';

import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/view/widgets/LogImage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verifycode extends StatelessWidget {
  const Verifycode({super.key});

  @override
  Widget build(BuildContext context) {
    veryfiycontrollersignupim controller = Get.put(veryfiycontrollersignupim());
    // Myservicese ser = Get.find();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "39".tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Appcolor.grey),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Handlingdataviwereq(
          statusReqests: controller.statusReqests,
          widget: ListView(padding: const EdgeInsets.only(top: 70), children: [
            const LogImg(),
            const SizedBox(
              height: 50,
            ),
            OtpTextField(
                // onCodeChanged: (value) {
                //   print(value);
                // },
                onSubmit: (value) {
                  controller.gotosignin(value);
                },
                numberOfFields: 5,
                clearText: true,
                keyboardType: TextInputType.number,
                borderRadius: BorderRadius.circular(10),
                showFieldAsBox: true,
                borderColor: Appcolor.primaryColor,
                focusedBorderColor: const Color.fromARGB(94, 192, 58, 43),
                contentPadding: const EdgeInsets.all(20),
                fieldHeight: 80,
                fieldWidth: 50,
                borderWidth: 2),
          ]),
        ));
  }
}
