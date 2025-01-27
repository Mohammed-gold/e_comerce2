import 'package:e_commerce/controller/map.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';

import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/constant/root_c.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AddreAdd extends StatelessWidget {
  AddreAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Map_view_Controllerr());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addres add'),
      ),
      body: GetBuilder<Map_view_Controllerr>(builder: (mapControllerr) {
        return Handlingdataviwe(
            statusReqests: mapControllerr.statusReqests,
            widget: Stack(
              alignment: Alignment.center,
              children: [
                if (mapControllerr.curenntMarker != null)
                  FlutterMap(
                    options: MapOptions(
                      initialZoom: 17,
                      initialCenter: mapControllerr.curenntMarker!,
                      onTap: (tapPosition, point) {
                        mapControllerr.addMarker(point);
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',

                        // Plenty of other options available!
                      ),
                      // if (mapControllerr.curenntMarker != null)
                      MarkerLayer(
                        markers: mapControllerr.markera,
                      ),
                      // GetBuilder<Map_view_Controllerr>(
                      //     builder: (mapControllerr2) {
                      //   return PolylineLayer(
                      //     polylines: [
                      //       Polyline(
                      //         points: mapControllerr2.ponit2,
                      //         strokeWidth: 4.0,
                      //         color: Colors.purple,
                      //       ),
                      //     ],
                      //   );
                      // })
                    ],
                  ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    width: 150,
                    child: MaterialButton(
                        color: Appcolor.primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          mapControllerr.gotoAddresDital();
                        },
                        child: Text("Adding Diteals",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
