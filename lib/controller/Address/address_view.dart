import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/address_data.dart';
import 'package:e_commerce/data/datasorce/network/map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:latlong2/spline.dart';

class AddressView_cont extends GetxController {
  List data = [];
  StatusReqests statusReqests = StatusReqests.none;

  Myservicese myservicese = Get.find();

  address_data addressdata = address_data();

  deletaddress(int id) async {
    statusReqests = StatusReqests.loading;
    var response = await addressdata.delet(id);
    statusReqests = Handlingdata(response);
    if (statusReqests == StatusReqests.success) {
      if (response['success'] == "true") {
        data.clear();
        Get.showSnackbar(GetSnackBar(
          title: "تم الحذف",
          message: "تم حذف العنوان بنجاح",
          duration: Duration(seconds: 2),
        ));

        veiwAddress();
        update();
      }
    }
  }

  veiwAddress() async {
    statusReqests = StatusReqests.loading;
    var response = await addressdata
        .view_add(myservicese.sharedPreferences.getString("id")!);
    statusReqests = Handlingdata(response);
    if (statusReqests == StatusReqests.success) {
      if (response['success'] == "true") {
        data.addAll(response["data"]);
        update();
        print("pppppppppppppppppppppppp$data");
        if (data.isEmpty) {
          statusReqests = StatusReqests.none;
        }
      } else if (response['success'] == "false") {
        statusReqests = StatusReqests.failure;
        update();
      }
    }
  }

  @override
  void onInit() async {
    veiwAddress();

    super.onInit();
  }
}
