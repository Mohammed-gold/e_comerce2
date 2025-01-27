// import 'package:e_commerce/core/Services/Servses.dart';
// import 'package:e_commerce/core/class/statusReqest.dart';
// import 'package:e_commerce/core/functions/handlingdata.dart';
// import 'package:e_commerce/data/datasorce/network/address_data.dart';
// import 'package:e_commerce/data/datasorce/network/map.dart';
// import 'package:geolocator/geolocator.dart';
// 
// import 'package:get/get.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:latlong2/spline.dart';
// 
// class AddressAddCont extends GetxController {
//   List data = [];
//   List<LatLng> ponit2 = [];
//   StatusReqests statusReqests = StatusReqests.none;
//   Mapdata mapdata = Mapdata();
//   address_data addressdata = address_data();
//   LatLng? curenntMarker;
//   LatLng? curenntMarker2;
//   Myservicese myservicese = Get.find();
// 
//   getcurentPotion() async {
//     statusReqests = StatusReqests.loading;
// 
//     Position position = await Geolocator.getCurrentPosition();
// 
//     curenntMarker = LatLng(position.latitude, position.longitude);
// 
//     curenntMarker2 = LatLng(position.longitude, position.latitude);
//     // Position == null ? null : LatLng(Position.latitude, Position.longitude);
//     //  LatLng(Position.latitude, Position.longitude);
//     print("================dddddddddd$curenntMarker");
//     if (curenntMarker == null) {
//       statusReqests = StatusReqests.loading;
//       Future.delayed(Duration(seconds: 2));
// 
//       update();
//     } else {
//       statusReqests = StatusReqests.none;
//       update();
//     }
//   }
// 
//   get_map() async {
//     statusReqests = StatusReqests.loading;
//     update();
//     if (curenntMarker2 == null) await getcurentPotion();
// 
//     var response = await mapdata.postdata(curenntMarker2!);
//     // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${response["data"]}");
//     statusReqests = Handlingdata(response);
//     if (StatusReqests.success == statusReqests) {
//       ponit2.clear();
//       // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${items}");
//       data = response["features"];
//       // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${data}");
//       List m = data[0]["geometry"]["coordinates"];
//       m.map((e) {
//         ponit2.add(LatLng(e[1], e[0]));
//       }).toList();
//       print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${ponit2}");
//       update();
//       // print("$response====================");
//     }
//     update();
//   }
// 
//   // veiwAddress() async {
//   //   statusReqests = StatusReqests.loading;
//   //   var response = await addressdata
//   //       .view_add(myservicese.sharedPreferences.getString("id")!);
//   //   statusReqests = Handlingdata(response);
//   //   if (statusReqests == StatusReqests.success) {
//   //     if (response['success'] == "true") {
//   //       data.addAll(response["data"]);
//   //       print("pppppppppppppppppppppppp$data");
//   //     }
//   //   }
//   // }
// 
//   @override
//   void onInit() async {
//     // veiwAddress();
//     await getcurentPotion();
//     get_map();
//     super.onInit();
//   }
// }
