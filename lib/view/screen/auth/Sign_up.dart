// ignore_for_file: file_names, camel_case_types, avoid_print

import 'package:e_commerce/controller/auth/Sign_up_co.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';

import 'package:e_commerce/core/constant/Appcolor.dart';

import 'package:e_commerce/core/functions/alertexit.dart';
import 'package:e_commerce/core/functions/validate.dart';
import 'package:e_commerce/view/widgets/LogImage.dart';
import 'package:e_commerce/view/widgets/auth/auth_text_form.dart';
import 'package:e_commerce/view/widgets/auth/custum_bu_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sig_up extends StatelessWidget {
  const Sig_up({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpcontim());

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "17".tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Appcolor.grey),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: GetBuilder<SignUpcontim>(
          builder: (controller) => Form(
            key: controller.formstate,
            child: PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  print(didPop);
                  if (!didPop) {
                    alertExit();
                  }
                },
                child: Handlingdataviwereq(
                  statusReqests: controller.statusReqests,
                  widget: ListView(
                    padding: const EdgeInsets.all(10),
                    // shrinkWrap: true,
                    children: [
                      const LogImg(),
                      const SizedBox(
                        height: 30,
                      ),

                      auth_Text_form(
                        keyboardType: TextInputType.name,
                        validator: (p0) => valdinput(p0!, 3, 15, "username"),
                        icon: Icons.person,
                        lable: "20".tr,
                        Hint: "23".tr,
                        textEditingController: controller.username,
                      ),
                      auth_Text_form(
                        keyboardType: TextInputType.emailAddress,
                        validator: (p0) => valdinput(p0!, 8, 33, "email"),
                        textEditingController: controller.email,
                        icon: Icons.mail_outline,
                        lable: "18".tr,
                        Hint: "12".tr,
                      ),
                      auth_Text_form(
                          keyboardType: TextInputType.phone,
                          validator: (p0) => valdinput(p0!, 9, 10, "phone"),
                          textEditingController: controller.phone,
                          icon: Icons.phone_android,
                          lable: "21".tr,
                          Hint: "22".tr),
                      auth_Text_form(
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) => valdinput(val!, 8, 23, ""),
                          secure: controller.showpassword,
                          onTapshowicon: controller.showpass,
                          textEditingController: controller.password,
                          icon: Icons.remove_red_eye,
                          lable: "19".tr,
                          Hint: "13".tr),

                      // auth_Text_form(
                      //     validator: (p0) => valdinput(p0!, 8, 10, "password"),
                      //       secure: true,
                      //     textEditingController: controller.password2,
                      //     icon: Icons.lock_outline_rounded,
                      //     lable: "Re_Password",
                      //     Hint: "Repet your Password"),
                      const SizedBox(
                        height: 16,
                      ),
                      Custum_bu_auth(
                        text: "17".tr,
                        onPressed: () {
                          controller.gotoverifycode();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              "25".tr,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.grey),
                            ),
                            InkWell(
                              onTap: () {
                                controller.gotologin();
                              },
                              child: Text(
                                "26".tr,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 16,
                                        color: Appcolor.primaryColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
