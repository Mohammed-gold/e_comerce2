// ignore_for_file: unused_import

import 'package:e_commerce/controller/cartc_contro.dart';
import 'package:e_commerce/controller/favorite.dart';
import 'package:e_commerce/controller/homepage/homepagecont.dart';
import 'package:e_commerce/controller/items_prodect.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/controller/search.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/data/model/appscreenmodel/catogires.dart';
import 'package:e_commerce/data/model/appscreenmodel/favorite.dart';

import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/view/screen/items_prodect.dart';

import 'package:e_commerce/view/widgets/home/shearch.dart';
import 'package:e_commerce/view/widgets/items/itemscat.dart';
import 'package:e_commerce/view/widgets/items/itemswedgets.dart';
import 'package:e_commerce/view/widgets/search/onsearch.dart';
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
    cartcontroller cart_cont = Get.put(cartcontroller());
    search_cont search_c = Get.find();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<search_cont>(builder: (controllera) {
        return ListView(children: [
          shearch(
            onChanged: (Value) {
              controllera.check(Value);
            },
            title: 'Find product',
            onnotifcation: () {},
            search: () {
              // controller.on_searh();
            },
            controller: controllera.textEditingController!,
          ),
          const SizedBox(
            height: 20,
          ),
          Itemscat(
            catogriesModel: catogriesModel,
          ),
          search_c.search
              ? Handlingdataviwe(
                  statusReqests: search_c.statusReqests,
                  widget: onsearch(
                    itemsm: search_c.data,
                  ))
              : GetBuilder<Itemscontim>(builder: (controler) {
                  return Handlingdataviwe(
                    statusReqests: controller.statusReqests,
                    widget: Container(
                      height: 600,
                      padding: const EdgeInsets.only(bottom: 60),
                      margin: const EdgeInsets.only(bottom: 50),
                      child: GridView.builder(
                        itemCount: controller.items.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          favoritec.isfavorite[controler.items[index]
                                  ["items_id"]] =
                              controler.items[index]['favorite'];
                          // cart_cont.itemsmod =
                          //     itemsmodel.fromJson(controller.items[index]);

                          return InkWell(
                            onTap: () {
                              cart_cont.itemsmod =
                                  itemsmodel.fromJson(controller.items[index]);

                              Get.toNamed(App_root.items_prodect, arguments: {
                                "itemomdel":
                                    itemsmodel.fromJson(controller.items[index])
                              });

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ));
                              //
                            },
                            child: itemswideget(
                              index,
                              itemsmode:
                                  itemsmodel.fromJson(controller.items[index]),
                              Active: true,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
        ]);
      }),
    ));
  }
}
