// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/forgetpasswordata.dart';
import 'package:e_commerce/view/widgets/auth/custum_bu_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class Forgetpassword extends GetxController {
  late TextEditingController email;
  Forgetpasswordata forgetpasswordata = Forgetpasswordata();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  goVrefiy();
}

class Forgetpasswordimp extends Forgetpassword {
  StatusReqests statusReqests = StatusReqests.none;
  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  goVrefiy() async {
    if (globalKey.currentState!.validate()) {
      statusReqests = StatusReqests.loading;
      update();
      var response = await forgetpasswordata.postdata(email.text);

      print("===================$response");
      statusReqests = Handlingdata(response);
      if (StatusReqests.success == statusReqests) {
        if (response['status'] == "success") {
          Get.toNamed(App_root.verifycodeforg,
              arguments: {"email": email.text});

          print("$response====================");
        } else {
          Get.defaultDialog(
              middleText: "عفوا الايميل غير موجود",
              confirm: Custum_bu_auth(
                text: "go to sign in",
                onPressed: () => Get.offAllNamed(App_root.login),
              ));
          update();
        }
        statusReqests = StatusReqests.failure;
      }
      update();
    }
  }
}
