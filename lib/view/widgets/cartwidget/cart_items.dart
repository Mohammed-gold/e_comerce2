import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cart_items extends StatelessWidget {
  final cartName;
  final price;
  final count;
  final String image;
  final void Function()? onadd;

  final void Function()? onmin;
  const cart_items({
    super.key,
    required this.cartName,
    required this.price,
    required this.count,
    required this.image,
    required this.onadd,
    required this.onmin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(10),
            child: CachedNetworkImage(
              imageUrl: image,
              height: 140,
              width: 180,
            ),
          )),
          Expanded(
              child: Column(
            // spacing: 0,
            children: [
              Container(height: 70, child: Text(cartName)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(" $price \$"),
                ],
              )
            ],
          )),
          Column(
            children: [
              IconButton(
                onPressed: onadd,
                icon: Icon(Icons.add),
              ),
              Text(
                textAlign: TextAlign.center,
                "$count",
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                onPressed: onmin,
                icon: Icon(Icons.minimize),
              )
            ],
          )
        ],
      ),
    );
  }
}
