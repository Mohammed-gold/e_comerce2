// ignore_for_file: non_constant_identifier_names

import 'package:e_commerce/controller/auth/logincont.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/functions/alertexit.dart';
import 'package:e_commerce/core/functions/validate.dart';
import 'package:e_commerce/view/widgets/LogImage.dart';
import 'package:e_commerce/view/widgets/auth/auth_text_form.dart';
import 'package:e_commerce/view/widgets/auth/custum_bu_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Logincimp log_controller = Get.put(Logincimp());

    return Scaffold(
        primary: true,
        extendBody: true,
        appBar: AppBar(
          // title: Text(
          //   "Sign In",
          //   style: Theme.of(context)
          //       .textTheme
          //       .headlineLarge!
          //       .copyWith(color: Appcolor.grey),
          // ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              alertExit();
            }
          },
          child: Form(
            key: log_controller.formstate,
            child: Handlingdataviwereq(
              statusReqests: log_controller.statusReqests,
              widget: ListView(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                children: [
                  const LogImg(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "10".tr,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      "11".tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  auth_Text_form(
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => valdinput(val!, 5, 32, "email"),
                    textEditingController: log_controller.email,
                    icon: Icons.mail_outline,
                    lable: "18".tr,
                    Hint: "12".tr,
                  ),
                  GetBuilder<Logincimp>(
                    builder: (controller) => auth_Text_form(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) => valdinput(val!, 8, 23, "password"),
                        secure: controller.showpassword,
                        onTapshowicon: controller.showpass,
                        textEditingController: log_controller.password,
                        icon: Icons.remove_red_eye,
                        lable: "19".tr,
                        Hint: "13".tr),
                  ),
                  Container(
                    width: 50,
                    padding: const EdgeInsets.only(left: 10, right: 30),
                    child: InkWell(
                      onTap: () {
                        log_controller.goForget();
                      },
                      child: Text(
                        "14".tr,
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Custum_bu_auth(
                    text: "15".tr,
                    onPressed: () {
                      log_controller.signin();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          "16".tr,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16, color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            log_controller.goSignup();
                          },
                          child: Text(
                            "17".tr,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            color: Color.fromARGB(255, 5, 48, 189),
                            Icons.facebook,
                            size: 50,
                          )),
                      const SizedBox(
                        width: 23,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.tiktok,
                            color: Color.fromARGB(255, 156, 20, 10),
                            size: 50,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
