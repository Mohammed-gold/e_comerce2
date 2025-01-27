// ignore_for_file: file_names, camel_case_types

import 'package:e_commerce/controller/homepage/Homescreencon.dart';
import 'package:e_commerce/controller/myfavorite.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/view/widgets/home/custombutton_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottomAppBar extends StatelessWidget {
  const bottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyFavoritec f = Get.put(MyFavoritec());
    return GetBuilder<Homescreencontim>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(202, 158, 158, 158),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 63,
        margin: EdgeInsets.only(
          left: 6,
          right: 7,
          bottom: 10,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 15,
          children: [
            // ...List.generate(controller.list_pages.length + 1, (index) {
            //   var i = index > 2 ? index - 1 : index;
            //   return index == 2
            //       ? const Spacer()
            //       : custombutton_appbar(
            //           text: controller.name[i],
            //           active: controller.currentpage == i ? true : false,
            //           icon: controller.icons[i],
            //           onPressed: () {
            //             if (i == 3) {
            //               f.getFavData();
            //             }
            //             controller.changepage(i);
            //           },
            //         );
            // })
            SizedBox(
              width: 5,
            ),
            custombutton_appbar(
              text: "home",
              active: controller.currentpage == 0 ? true : false,
              icon: Icons.home,
              onPressed: () {
                if (0 == 3) {
                  f.getFavData();
                }
                controller.changepage(0);
              },
            ),

            custombutton_appbar(
              text: "Profile",
              active: controller.currentpage == 1 ? true : false,
              icon: Icons.person_pin,
              onPressed: () {
                controller.changepage(1);
              },
            ),
            SizedBox(
              width: 60,
            ),
            custombutton_appbar(
              text: "Favorite",
              active: controller.currentpage == 2 ? true : false,
              icon: Icons.favorite_border,
              onPressed: () {
                f.getFavData();

                controller.changepage(2);
              },
            ),
            custombutton_appbar(
              text: "Setting",
              active: controller.currentpage == 3 ? true : false,
              icon: Icons.settings,
              onPressed: () {
                f.getFavData();

                controller.changepage(3);
              },
            )
          ],
        ),
      ),
    );
  }
}
