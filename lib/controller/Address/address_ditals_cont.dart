import 'package:e_commerce/controller/homepage/Homescreencon.dart';
import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/address_data.dart';
import 'package:e_commerce/data/datasorce/network/map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:latlong2/spline.dart';

class AddressDitalsCont extends GetxController {
  StatusReqests statusReqests = StatusReqests.none;

  TextEditingController? PalceName;

  TextEditingController? City;

  TextEditingController? Street;
  double? lat;
  double? long;
  Myservicese myservicese = Get.find();
  address_data addressdata = address_data();
  @override
  void onInit() {
    PalceName = TextEditingController();
    City = TextEditingController();
    Street = TextEditingController();
    lat = Get.arguments["lat"];
    long = Get.arguments["long"];
    super.onInit();
  }

  // Homescreencontim cont = Get.find();
  add_detials() async {
    statusReqests = StatusReqests.loading;
    var response = await addressdata.add(
        PalceName!.text,
        City!.text,
        myservicese.sharedPreferences.getString("id")!,
        "$lat",
        "$long",
        Street!.text);
    statusReqests = Handlingdata(response);
    if (statusReqests == StatusReqests.success) {
      // cont.changepage(0);
      Get.toNamed(App_root.homepage);
    }
  }
}
