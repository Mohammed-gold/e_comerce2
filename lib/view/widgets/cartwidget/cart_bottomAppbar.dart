import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';

class cart_bottomAppbar extends StatelessWidget {
  final String Price;
  final String Shipping;
  final String totalPrice;
  const cart_bottomAppbar({
    super.key,
    required this.Price,
    required this.Shipping,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Price"), Text(Price)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Shipping"), Text(Shipping)],
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
                      color: Appcolor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                totalPrice,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Appcolor.primaryColor),
              )
            ],
          ),
          MaterialButton(
            child: Text(
              "Confirm selling",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Appcolor.primaryColor,
            minWidth: 250,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
