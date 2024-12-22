// ignore_for_file: file_names

import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/Signupsurce.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SigUpcont extends GetxController {
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password2;
  late TextEditingController password;
  late TextEditingController username;
  late GlobalKey<FormState> formstate;
  gotologin();
  gotoverifycode();
}

class SignUpcontim extends SigUpcont {
  Signupsurce signupsurce = Signupsurce();
  List data = [];

  StatusReqests statusReqests = StatusReqests.none;
  bool showpassword = true;
  showpass() {
    showpassword = showpassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    formstate = GlobalKey();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    password2 = TextEditingController();
    username = TextEditingController();

    super.onInit();
  }

  @override
  gotologin() {
    Get.offAllNamed(App_root.login);
  }

  @override
  gotoverifycode() async {
    if (formstate.currentState!.validate()) {
      statusReqests = StatusReqests.loading;
      update();
      var response = await signupsurce.postdata(
          username.text, password.text, email.text, phone.text);
      // print("===================$response");
      statusReqests = Handlingdata(response);
      if (StatusReqests.success == statusReqests) {
        if (response['message'] == "User created successfully.") {
          Get.defaultDialog(
              title: "Creat User", middleText: "User created successfully.");
          // data.addAll(response['data']);
          await Future.delayed(const Duration(seconds: 4));
          Get.offAllNamed(App_root.login, arguments: {"email": email.text});
          // print("$response====================");
        } else if (response['errors']["email"][0] ==
            "This email is already in use.") {
          Get.defaultDialog(
              title: "!", middleText: "This email is already in use");
          statusReqests = StatusReqests.failure;
        }
      }
      update();
    } else {}
  }
}
