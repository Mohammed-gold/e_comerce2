import 'package:e_commerce/controller/homepage/homepagecont.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';

import 'package:e_commerce/view/widgets/home/catogres.dart';
import 'package:e_commerce/view/widgets/home/heading_bord.dart';
import 'package:e_commerce/view/widgets/home/h_itesm.dart';
import 'package:e_commerce/view/widgets/home/shearch.dart';
import 'package:e_commerce/view/widgets/home/titlewedegt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homepagecontim());
    Get.put(Itemscontim());
    return GetBuilder<Homepagecontim>(
        builder: (controller) => Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 600,
            height: 800,
            child: Handlingdataviwe(
                statusReqests: controller.statusReqests,
                widget: ListView(
                  children: [
                    shearch(
                      title: 'Find product',
                      onnotifcation: () {},
                      search: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const heading_bord(
                      title: 'Summer Supries',
                      body: "Cash Back 20%",
                    ),
                    const Titlewedegt(
                      title: "Catogries",
                    ),
                    const catogries(),
                    const Titlewedegt(
                      title: "Prodect for you",
                    ),
                    const Items(
                      t: false,
                    ),
                    const Titlewedegt(
                      title: "Offer",
                    ),
                    const Items(
                      t: true,
                    ),
                  ],
                ))));
  }
}
