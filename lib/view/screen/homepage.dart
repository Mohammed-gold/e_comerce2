import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/homepage/homepagecont.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/controller/search.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/linkurl.dart';

import 'package:e_commerce/view/widgets/home/catogres.dart';
import 'package:e_commerce/view/widgets/home/heading_bord.dart';
import 'package:e_commerce/view/widgets/home/h_itesm.dart';
import 'package:e_commerce/view/widgets/home/shearch.dart';
import 'package:e_commerce/view/widgets/home/titlewedegt.dart';
import 'package:e_commerce/view/widgets/search/onsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homepagecontim());
    Get.put(Itemscontim());
    search_cont conter = Get.put(search_cont());
    return GetBuilder<search_cont>(
        builder: (controller) => Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: 600,
              height: 800,
              child: ListView(shrinkWrap: true, children: [
                shearch(
                  onChanged: (Value) {
                    conter.check(Value);
                  },
                  title: 'Find product',
                  onnotifcation: () {},
                  search: () {
                    // controller.on_searh();
                  },
                  controller: controller.textEditingController!,
                ),
                const SizedBox(
                  height: 20,
                ),
                conter.search == true
                    ? Handlingdataviwe(
                        statusReqests: controller.statusReqests,
                        widget: onsearch(
                          itemsm: controller.data,
                        ))
                    : GetBuilder<Homepagecontim>(builder: (controller) {
                        return Handlingdataviwe(
                            statusReqests: controller.statusReqests,
                            widget: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                heading_bord(
                                  title: 'Summer Supries',
                                  body: "Cash Back 20%",
                                ),
                                Titlewedegt(
                                  title: "Catogries",
                                ),
                                catogries(),
                                Titlewedegt(
                                  title: "Prodect for you",
                                ),
                                Items(
                                  t: false,
                                ),
                                Titlewedegt(
                                  title: "Offer",
                                ),
                                // Items(
                                //   t: true,
                                // ),
                              ],
                            ));
                      })
              ]),
            ));
  }
}
