// ignore_for_file: unused_import

import 'package:e_commerce/controller/favorite.dart';
import 'package:e_commerce/controller/homepage/homepagecont.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/data/model/appscreenmodel/catogires.dart';
import 'package:e_commerce/data/model/appscreenmodel/favorite.dart';

import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/view/screen/items_prodect.dart';

import 'package:e_commerce/view/widgets/home/shearch.dart';
import 'package:e_commerce/view/widgets/items/itemscat.dart';
import 'package:e_commerce/view/widgets/items/itemswedgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsSc extends StatelessWidget {
  final CatogriesModel catogriesModel;
  final int index;
  const ItemsSc({super.key, required this.index, required this.catogriesModel});

  @override
  Widget build(BuildContext context) {
    Itemscontim controller = Get.put(Itemscontim());
    Favoritec favoritec = Get.put(Favoritec());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        Container(
            margin: const EdgeInsets.only(
              top: 17,
            ),
            child: shearch(
              title: 'Find product',
              onnotifcation: () {},
              search: () {},
            )),
        const SizedBox(
          height: 20,
        ),
        Itemscat(
          catogriesModel: catogriesModel,
        ),
        GetBuilder<Itemscontim>(builder: (controler) {
          return Handlingdataviwe(
            statusReqests: controller.statusReqests,
            widget: Container(
              height: 600,
              padding: const EdgeInsets.only(bottom: 60),
              margin: const EdgeInsets.only(bottom: 50),
              child: GridView.builder(
                itemCount: controller.items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  favoritec.isfavorite[controler.items[index]["items_id"]] =
                      controler.items[index]['favorite'];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemsProdect(
                                    index: index,
                                    itemsm: itemsmodel
                                        .fromJson(controller.items[index]),
                                  )));
                    },
                    child: itemswideget(
                      index,
                      itemsmode: itemsmodel.fromJson(controller.items[index]),
                      Active: true,
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ]),
    ));
  }
}
