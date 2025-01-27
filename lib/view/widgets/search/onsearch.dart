import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/search.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onsearch extends GetView<search_cont> {
  final itemsm;

  const onsearch({
    super.key,
    required this.itemsm,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemsm.length,
        itemBuilder: (context, index) => Container(
                child: Card(
              child: Row(children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    imageUrl: "${Appurl.items}${itemsm[index].itemsImage}",
                    height: 140,
                    width: 180,
                  ),
                )),
                Container(
                  height: 100,
                  width: 0.4,
                  color: Colors.black,
                ),
                Expanded(
                  child: Column(
                      // spacing: 0,
                      children: [
                        Container(
                            height: 70,
                            child: Text("${itemsm[index].itemsName}")),
                        Text(
                          " ${controller.data[index].itemsPrice} \$",
                          style: TextStyle(color: Appcolor.primaryColor),
                        ),
                      ]),
                )
              ]),
            )));
  }
}
