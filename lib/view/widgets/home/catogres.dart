// ignore_for_file: camel_case_types, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/homepage/homepagecont.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/functions/transleatedatabase.dart';
import 'package:e_commerce/data/model/appscreenmodel/catogires.dart';
import 'package:e_commerce/view/screen/items.dart';
import 'package:e_commerce/view/widgets/home/h_itesm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class catogries extends StatelessWidget {
  const catogries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Homepagecontim controller = Get.find();
    return SizedBox(
        height: 120,
        child: ListView.builder(
            itemCount: controller.catogires.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Catogresmod(index,
                catogriesModel:
                    CatogriesModel.fromJson(controller.catogires[index]))));
  }
}

class Catogresmod extends GetView<Homepagecontim> {
  final CatogriesModel catogriesModel;
  final int index;

  const Catogresmod(this.index, {super.key, required this.catogriesModel});

  @override
  Widget build(BuildContext context) {
    // bool n = false;

    Itemscontim i = Get.put(Itemscontim());
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              color: Appcolor.primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: IconButton(
            onPressed: () {
              i.changselect(index, catogriesModel.catId!);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemsSc(
                      index: index,
                      catogriesModel: catogriesModel,
                    ),
                  ));
            },
            icon: Icon(Icons.abc),
            iconSize: 40,
            color: Appcolor.secondColor,
          ),
        ),
        Text(
          translatedatabase(catogriesModel.catNameAr!, catogriesModel.catName),
          style: const TextStyle(
              fontSize: 14,
              color: Appcolor.primaryColor,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
