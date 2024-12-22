// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favorite.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/controller/myfavorite.dart';
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
class Favitemswideget extends GetView<MyFavoritec> {
  final favoritemodel favoritemod;
  // final Favoritemod favoritemod;

  final int index;

  const Favitemswideget({
    super.key,
    required this.index,
    required this.favoritemod,
  });

  @override
  Widget build(BuildContext context) {
    // Itemscontim controller = Get.find();

    return Handlingdataviwe(
      statusReqests: controller.statusReqests,
      widget: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: index,
              child: CachedNetworkImage(
                imageUrl: "${Appurl.items}${favoritemod.itemsImage}",
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
                  favoritemod.itemsNameAr!, favoritemod.itemsName),
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
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
                      // color: Appcolor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text("5.1"),
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${favoritemod.itemsPrice} \$",
                  style: TextStyle(
                      color: Appcolor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                GetBuilder<MyFavoritec>(builder: (controller) {
                  return IconButton(
                      onPressed: () {
                        controller.removeFav(favoritemod.favId);
                      },
                      icon: Icon(
                        Icons.delete_outline,
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
