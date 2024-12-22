// ignore_for_file: camel_case_types, avoid_print

import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/useraprove.dart';
import 'package:e_commerce/data/datasorce/network/verfiysignupRemote.dart';
import 'package:e_commerce/view/widgets/auth/custum_bu_auth.dart';

import 'package:get/get.dart';

abstract class veryfiycontrollersignup extends GetxController {
  Myservicese? myservicese;
  String? sharePref;
  gotosignin(String verfiycode);
}

class veryfiycontrollersignupim extends veryfiycontrollersignup {
  Verfiysignupremote verfiysignupremote = Verfiysignupremote();
  Useraprove useraprove = Useraprove();
  String? email;
  StatusReqests statusReqests = StatusReqests.none;

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  gotosignin(String verfiycode) async {
    statusReqests = StatusReqests.loading;
    update();
    var response = await verfiysignupremote.postdata(verfiycode, email!);
    var response2 = await useraprove.postdata(email!);
    print("===================$response");
    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['status'] == "success") {
        Get.defaultDialog(
            title: "تسجيل الساب",
            middleText: " تم تفعيل الحساب بنجاح",
            confirm: Custum_bu_auth(
              text: "go to sign in",
              onPressed: () => Get.offAllNamed(App_root.login),
            ));
        // data.addAll(response['data']);

        print("$response====================");
      } else if (response2['status'] == '1') {
        Get.defaultDialog(
            middleText: "تم تفعيل الحساب مسبقا",
            onWillPop: () {
              Get.offAllNamed(App_root.login);
              return Future.value(true);
            },
            confirm: Custum_bu_auth(
              text: "go to sign in",
              onPressed: () => Get.offAllNamed(App_root.login),
            ));

        update();
      } else {
        Get.defaultDialog(
            middleText: "لقد ادخلت رقم تاكيد خاطىء",
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
