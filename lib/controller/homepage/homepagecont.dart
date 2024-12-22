// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
// import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/homedata.dart';
// import 'package:e_commerce/view/screen/items.dart';

import 'package:get/get.dart';

abstract class Homepagecont extends GetxController {
  Myservicese myservices = Get.find();

  late var username;

  late var email;

  late var phone;
  late var id;

  getdata();
  // gotoitems(BuildContext context);
  initldata();
}

class Homepagecontim extends Homepagecont {
  Homedata homedata = Homedata();

  List catogires = [];

  List items1 = [];
  String lang = 'ar';
  StatusReqests statusReqests = StatusReqests.none;

  @override
  initldata() {
    username = myservices.sharedPreferences.getString("username");

    email = myservices.sharedPreferences.getString("email");

    phone = myservices.sharedPreferences.getString("phone");

    id = myservices.sharedPreferences.getString("id");
    getdata();
  }

  @override
  void onInit() {
    initldata();
    super.onInit();
  }

  @override
  getdata() async {
    statusReqests = StatusReqests.loading;
    update();
    var response = await homedata.postdata();
    // print("===================$response");
    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        items1.addAll(response["items"]);

        catogires.addAll(response["catogre"]);
        // print("7777777777777777777777777777777777777$catogires");
        // print("7777777777777777777777777777777777777$items1");
        // List<dynamic> items1 = item["items"];
        // items.addAll(items1);
        // print("========================$items");
        // print(
        //     "|||||||||||||||||||||||||||||||||||||||||||||||||||||||$catogires");
      }
      // for (var cat in data) {
      //   List<dynamic> cat1 = cat["category"];
      //   items.addAll(cat1);
      //   print("========================$items");
      // }

      // catogires.addAll(response['data'][0]["category"]);

      // print("$response====================");
    } else {
      statusReqests = StatusReqests.failure;
      // print(statusReqests);
    }
    // }
    update();
  }

//   gotoitems(BuildContext context) {
//  Navigator.push(context, MaterialPageRoute(builder: (context) => ItemsSc(),));
//
//   }
}
