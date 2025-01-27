import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/homepage/homepagecont.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/core/Translation/LocalLang.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/transleatedatabase.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/linkurl.dart';
// import 'package:e_commerce/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends GetView<Homepagecontim> {
  final bool t;
  const Items({
    required this.t,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170,
        child: ListView.builder(
            reverse: t,
            scrollDirection: Axis.horizontal,
            itemCount: controller.items1.length,
            itemBuilder: (context, index) => Itemmo(
                t: t,
                itemsModel: itemsmodel.fromJson(controller.items1[index]))));
  }
}

class Itemmo extends GetView<Itemscontim> {
  final bool t;
  final itemsmodel itemsModel;
  const Itemmo({super.key, required this.itemsModel, required this.t});

  @override
  Widget build(BuildContext context) {
    LocalLang controllear = Get.find();
    return InkWell(
      onTap: () {
        Get.toNamed(App_root.items_prodect, arguments: {
          "itemomdel": itemsModel,
        });
      },
      child: Stack(
        children: [
          Hero(
            tag: "${itemsModel.itemsId}",
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CachedNetworkImage(
                  imageUrl: "${Appurl.items}${itemsModel.itemsImage}",
                  width: 160,
                  height: 140,
                  fit: BoxFit.contain,
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 170,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.2)),
          ),
          Positioned(
            top: 7,
            left: controllear.lang == const Locale("en") ? 30 : null,
            right: controllear.lang == const Locale("ar") ? 30 : null,
            child: Text(
              translatedatabase(itemsModel.itemsNameAr!, itemsModel.itemsName),
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
