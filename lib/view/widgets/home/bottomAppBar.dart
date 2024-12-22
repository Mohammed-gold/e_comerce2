// ignore_for_file: file_names, camel_case_types

import 'package:e_commerce/controller/homepage/Homescreencon.dart';
import 'package:e_commerce/controller/myfavorite.dart';
import 'package:e_commerce/view/widgets/home/custombutton_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottomAppBar extends StatelessWidget {
  const bottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyFavoritec f = Get.find();
    return GetBuilder<Homescreencontim>(
        builder: (controller) => BottomAppBar(
              height: 80,
              notchMargin: 13,
              shape: const CircularNotchedRectangle(),
              child: Row(
                children: [
                  ...List.generate(controller.list_pages.length + 1, (index) {
                    var i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : custombutton_appbar(
                            text: controller.name[i],
                            active: controller.currentpage == i ? true : false,
                            icon: controller.icons[i],
                            onPressed: () {
                              if (i == 3) {
                                f.getFavData();
                              }
                              controller.changepage(i);
                            },
                          );
                  })
                ],
              ),
            ));
  }
}
