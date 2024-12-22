// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favorite.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/functions/transleatedatabase.dart';
import 'package:e_commerce/data/model/appscreenmodel/favorite.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/linkurl.dart';
//
// import 'package:e_commerce/linkurl.dart';
// import 'package:e_commerce/view/screen/items_prodect.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class itemswideget extends StatelessWidget {
  final itemsmodel itemsmode;
  // final Favoritemod favoritemod;
  final fav1;
  final fav2;
  final int index;
  final bool Active;
  const itemswideget(
    this.index, {
    super.key,
    required this.itemsmode,
    required this.Active,
    this.fav1,
    this.fav2,
  });

  @override
  Widget build(BuildContext context) {
    Itemscontim controller = Get.find();

    return Handlingdataviwe(
      statusReqests: controller.statusReqests,
      widget: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: index,
              child: CachedNetworkImage(
                imageUrl: "${Appurl.items}${itemsmode.itemsImage}",
                width: 140,
                height: 110,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              translatedatabase(
                itemsmode.itemsNameAr!,
                itemsmode.itemsName,
              ),
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Rate",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.primaryColor),
                ),
                Row(
                  spacing: 3,
                  children: [
                    Text("5.1"),
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                      size: 17,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${itemsmode.itemsPrice} \$",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.primaryColor),
                ),
                GetBuilder<Favoritec>(builder: (controller) {
                  return IconButton(
                      onPressed: () {
                        if (controller.isfavorite[itemsmode.itemsId] == 1) {
                          controller.setfavorite(itemsmode.itemsId, 0);
                          controller.deletfav(itemsmode.itemsId);
                        } else if (controller.isfavorite[itemsmode.itemsId] ==
                            0) {
                          controller.setfavorite(itemsmode.itemsId, 1);
                          controller.addfav(itemsmode.itemsId);
                        }
                      },
                      icon: Icon(
                        controller.isfavorite[itemsmode.itemsId] == 1
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Appcolor.primaryColor,
                      ));
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
