import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class Map_view_Controllerr extends GetxController {
  List data = [];
  List<LatLng> ponit2 = [];
  List<Marker> markera = [];
  StatusReqests statusReqests = StatusReqests.none;
  Mapdata mapdata = Mapdata();
  LatLng? curenntMarker;
  LatLng? curenntMarker2;
  double? lat;
  double? long;

  addMarker(LatLng latLng) {
    markera.clear();
    markera.add(Marker(
        point: latLng,
        child: Icon(
          Icons.location_on,
          size: 40,
          color: Colors.red,
        )));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  gotoAddresDital() {
    Get.toNamed(App_root.addressDitels, arguments: {"lat": lat, "long": long});
  }

  getcurenztPotion() async {
    statusReqests = StatusReqests.loading;

    Position position = await Geolocator.getCurrentPosition();

    curenntMarker = LatLng(position.latitude, position.longitude);

    curenntMarker2 = LatLng(position.longitude, position.latitude);
    // Position == null ? null : LatLng(Position.latitude, Position.longitude);
    //  LatLng(Position.latitude, Position.longitude);
    print("================dddddddddd$curenntMarker");
    if (curenntMarker == null) {
      statusReqests = StatusReqests.loading;
      Future.delayed(Duration(seconds: 2));

      update();
    } else {
      statusReqests = StatusReqests.none;
      update();
    }
  }

  get_map() async {
    statusReqests = StatusReqests.loading;
    update();
    if (curenntMarker2 == null) await getcurenztPotion();

    var response = await mapdata.postdata(curenntMarker2!);
    // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${response["data"]}");
    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      ponit2.clear();
      // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${items}");
      data = response["features"];
      // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${data}");
      List m = data[0]["geometry"]["coordinates"];
      m.map((e) {
        ponit2.add(LatLng(e[1], e[0]));
      }).toList();
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${ponit2}");
      update();
      // print("$response====================");
    }
    update();
  }

  @override
  void onInit() async {
    await getcurenztPotion();
    get_map();
    super.onInit();
  }
}
