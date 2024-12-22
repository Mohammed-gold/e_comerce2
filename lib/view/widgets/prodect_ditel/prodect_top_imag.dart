import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/linkurl.dart';
// import 'package:e_commerce/linkurl.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class prodectditelImg extends StatelessWidget {
  const prodectditelImg({
    super.key,
    required this.index,
    required this.itemsm,
  });

  final int index;
  final itemsmodel itemsm;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //margin: EdgeInsets.only(top: 10),

          height: 170,
          decoration: BoxDecoration(
            color: Appcolor.secondColor.withOpacity(.9),
            //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(10),top:Radius.circular(120) )
          ),
        ),
        Hero(
          key: ValueKey(index),
          tag: index,
          child: Center(
            child: Container(
                alignment: Alignment.center,
                height: 250,
                width: 250,
                margin: const EdgeInsets.only(top: 46),
                child: CachedNetworkImage(
                  imageUrl: "${Appurl.items}${itemsm.itemsImage}",
                  fit: BoxFit.fill,
                  height: 300,
                )),
          ),
        ),
      ],
    );
  }
}
