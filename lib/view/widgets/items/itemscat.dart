import 'package:e_commerce/controller/homepage/homepagecont.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/functions/transleatedatabase.dart';
import 'package:e_commerce/data/model/appscreenmodel/catogires.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemscat extends StatelessWidget {
  final CatogriesModel catogriesModel;

  const Itemscat({
    super.key,
    required this.catogriesModel,
  });

  @override
  Widget build(BuildContext context) {
    Homepagecontim controller = Get.find();

    return SizedBox(
        height: 80,
        child: ListView.builder(
            itemCount: controller.catogires.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Itemscatmod(index,
                catogriesModel:
                    CatogriesModel.fromJson(controller.catogires[index]))));
  }
}

class Itemscatmod extends StatelessWidget {
  final CatogriesModel catogriesModel;
  final int index;
  const Itemscatmod(this.index, {super.key, required this.catogriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<Itemscontim>(
          builder: (controller) => InkWell(
            onTap: () {
              controller.changselect(index, catogriesModel.catId!);
            },
            child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: controller.selecteditem == index
                    ? const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Appcolor.primaryColor, width: 3)))
                    : null,
                child: Text(
                  translatedatabase(
                      catogriesModel.catNameAr!, catogriesModel.catName),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Appcolor.grey,
                      fontWeight: FontWeight.bold),
                )),
          ),
        )
      ],
    );
  }
}
