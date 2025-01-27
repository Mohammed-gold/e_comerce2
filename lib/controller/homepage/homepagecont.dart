// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:e_commerce/controller/map.dart';
import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/images.dart';
// import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/homedata.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  List icons = [Icons, Icons.settings, Icons.person, Icons.favorite_border];
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

  Map_view_Controllerr map_view_Controllerr = Get.put(Map_view_Controllerr());
  @override
  void onInit() {
    initldata();
    determinePosition();
    map_view_Controllerr.getcurenztPotion();

    super.onInit();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Get.snackbar("title", "message");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Get.snackbar("title", "message");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("title", "message");
      ;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
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
