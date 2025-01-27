import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // width: Get.width / 2,
          height: Get.height / 3.6,

          decoration: BoxDecoration(
            color: Appcolor.primaryColor,
          ),
        ),
        Positioned(
            top: Get.height / 4.9,
            left: Get.width / 3.0,
            // right: Get.width / 2,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 247, 245, 245),
              radius: 60,
              child: Icon(
                Icons.settings_sharp,
                size: 100,
                color: Colors.grey,
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
                  title: Text("Dark Mode"),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                ListTile(
                  title: Text("Contact us"),
                  trailing: Icon(
                    Icons.network_ping_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(App_root.Addressviwe);
                  },
                  title: Text("address us"),
                  trailing: Icon(
                    Icons.network_ping_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
                ListTile(
                  title: Text("About us"),
                  trailing: Icon(
                    Icons.info_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                ListTile(
                  title: Text("Help"),
                  trailing: Icon(
                    Icons.help,
                    color: Colors.grey,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
