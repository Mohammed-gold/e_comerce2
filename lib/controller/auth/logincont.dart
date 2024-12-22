import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/logindata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class Loginc extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> formstate;
  StatusReqests statusReqests = StatusReqests.none;
  Myservicese myservicese = Get.find();

  Logindata logindata = Logindata();
  bool showpassword = true;
  showpass();

  goSignup();
  goForget();
  signin();
}

class Logincimp extends Loginc {
  List data = [];
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  goForget() {
    Get.toNamed(App_root.forgetPass);
  }

  @override
  goSignup() {
    Get.toNamed(App_root.sigin);
  }

  @override
  signin() async {
    if (formstate.currentState!.validate()) {
      statusReqests = StatusReqests.loading;
      update();
      var response = await logindata.postdata(password.text, email.text);

      statusReqests = Handlingdata(response);
      if (StatusReqests.success == statusReqests) {
        // print("$statusReqests ///////////////////////////////////////////////");
        if (response['success'] == true) {
          myservicese.sharedPreferences
              .setString("username", "${response['data']['name']}");

          myservicese.sharedPreferences
              .setString("email", "${response['data']['email']}");

          myservicese.sharedPreferences
              .setString("phone", "${response['data']['phone']}");
          myservicese.sharedPreferences
              .setString("id", "${response['data']['id']}");

          myservicese.sharedPreferences.setString("step", '2');

          Get.offAllNamed(App_root.homepage);
        } else if (response['success'] == "false") {
          // if (response['message'] == "user does not exist") {
          //   Get.defaultDialog(title: "!", middleText: "user does not exist");
          //   statusReqests = StatusReqests.failure;
          // } else if (response['message'] == "wrong password") {
          //   Get.defaultDialog(title: "!", middleText: "wrong password");
          statusReqests = StatusReqests.failure;
          // }
        }
      } else if (StatusReqests.serverfailure == statusReqests) {
        // print("$statusReqests 11111111111111111111111111111111111111");
      }

      update();
    } else {
      // print("NotValid");
    }
  }

  @override
  showpass() {
    showpassword = showpassword == true ? false : true;
    update();
  }
}
