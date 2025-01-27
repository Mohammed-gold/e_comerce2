import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // width: Get.width / 2,
          height: Get.height / 3.6,
          color: Appcolor.primaryColor,
        ),
        Positioned(
            top: Get.height / 4.3,
            left: Get.width / 2.7,
            // right: Get.width / 2,
            child: CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person_4,
                size: 60,
              ),
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 400,
          margin: EdgeInsets.only(top: 280),
          child: Card(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text("MohammedHisham"),
                  subtitle: Text(
                    "MohammedHisham@gmail.com",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ListTile(
                  title: Text("Locaion "),
                  subtitle: Text(
                    "khartuom",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ListTile(
                  title: Text("Credit Carts"),
                  subtitle: Text(
                    "Paypal,etc",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                // ListTile(
                //   title: Text("Help"),
                // )
              ],
            ),
          ),
        )
      ],
    );
  }
}
