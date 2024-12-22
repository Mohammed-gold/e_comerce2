// ignore_for_file: camel_case_types

import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';

class prodectprice_cunt extends StatelessWidget {
  final void Function() addc;
  final void Function() min;
  final String price;

  final String count;
  const prodectprice_cunt({
    super.key,
    required this.addc,
    required this.min,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 30, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(onPressed: addc, icon: const Icon(Icons.add)),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 4),
                  width: 50,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(count)),
              IconButton(onPressed: min, icon: const Icon(Icons.remove)),
            ],
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 25, color: Appcolor.secondColor),
          )
        ],
      ),
    );
  }
}
