import 'dart:math';

import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';

class cart_bottomAppbar extends StatelessWidget {
  final String Price;
  final String Shipping;
  final String totalPrice;
  final String discount;
  final TextEditingController cobon_text_con;
  final void Function()? cobon_onPress;
  const cart_bottomAppbar({
    super.key,
    required this.Price,
    required this.Shipping,
    required this.totalPrice,
    required this.discount,
    required this.cobon_text_con,
    required this.cobon_onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 6.0, left: 16, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: cobon_text_con,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Appcolor.primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Appcolor.primaryColor),
                            borderRadius: BorderRadius.circular(10))),
                  )),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Appcolor.primaryColor,
                        onPressed: cobon_onPress,
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ))
            ],
          ),
        ),
        Container(
          width: 330,
          padding: EdgeInsets.only(top: 22),
          margin: const EdgeInsets.only(top: 3, bottom: 10, left: 5, right: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Appcolor.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "discount",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    discount,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Shipping",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Shipping,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                endIndent: 40,
                indent: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 16,
                          color: Appcolor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    totalPrice,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.primaryColor),
                  )
                ],
              ),
              MaterialButton(
                child: Text(
                  "Confirm Order",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Appcolor.primaryColor,
                minWidth: 250,
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
