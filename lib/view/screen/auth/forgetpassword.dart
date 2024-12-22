// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/controller/auth/forgetpass.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/functions/validate.dart';
import 'package:e_commerce/view/widgets/LogImage.dart';
import 'package:e_commerce/view/widgets/auth/auth_text_form.dart';
import 'package:e_commerce/view/widgets/auth/custum_bu_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Forgetpasswordimp controller = Get.put(Forgetpasswordimp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "27".tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Appcolor.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Form(
        key: controller.globalKey,
        child: Handlingdataviwereq(
          statusReqests: controller.statusReqests,
          widget: GetBuilder<Forgetpasswordimp>(
            builder: (controller) => ListView(
              padding: EdgeInsets.all(10),
              // shrinkWrap: true,
              children: [
                LogImg(),
                SizedBox(
                  height: 30,
                ),
                auth_Text_form(
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: controller.email,
                  icon: Icons.mail_outline,
                  lable: "18".tr,
                  Hint: "12".tr,
                  validator: (val) => valdinput(val!, 10, 33, "email"),
                ),
                const SizedBox(
                  height: 16,
                ),
                Custum_bu_auth(
                  text: "30".tr,
                  onPressed: () {
                    controller.goVrefiy();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
