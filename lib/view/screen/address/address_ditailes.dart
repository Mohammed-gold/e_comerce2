import 'package:e_commerce/controller/Address/address_ditals_cont.dart';
import 'package:e_commerce/controller/map.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/view/widgets/auth/auth_text_form.dart';
import 'package:e_commerce/view/widgets/auth/custum_bu_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AddressDitailes extends StatelessWidget {
  AddressDitailes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDitalsCont());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ditals'),
      ),
      body: GetBuilder<AddressDitalsCont>(builder: (controller) {
        return Handlingdataviwe(
            statusReqests: controller.statusReqests,
            widget: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                auth_Text_form(
                    Hint: "Name",
                    icon: Icons.near_me,
                    lable: "Name",
                    textEditingController: controller.PalceName!),
                auth_Text_form(
                    Hint: "city",
                    icon: Icons.home,
                    lable: "city",
                    textEditingController: controller.City!),
                auth_Text_form(
                    Hint: "Street",
                    icon: Icons.streetview,
                    lable: "Street",
                    textEditingController: controller.Street!),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Appcolor.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.add_detials();
                    },
                    child: Text("Apply"),
                  ),
                )
              ],
            ));
      }),
    );
  }
}
