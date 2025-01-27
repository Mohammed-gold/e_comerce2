// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_commerce/controller/items_prodect.dart';
// import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/controller/cartc_contro.dart';
import 'package:e_commerce/controller/items_prodect.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
// import 'package:e_commerce/linkurl.dart';
import 'package:e_commerce/view/widgets/prodect_ditel/prodect_top_imag.dart';
import 'package:e_commerce/view/widgets/prodect_ditel/prodectprice_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class ItemsProdect extends StatelessWidget {
  const ItemsProdect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsProdectimp());
    cartcontroller cont = Get.put(cartcontroller());

    return Scaffold(
      bottomNavigationBar: Container(
        // padding: EdgeInsets.all(30),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Appcolor.secondColor,
            borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: MaterialButton(
          onPressed: () {
            cont.refreshada();
            Get.toNamed(App_root.Cart);
          },
          child: const Text(
            "Go to card",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: GetBuilder<ItemsProdectimp>(builder: (controller) {
          return ListView(
            children: [
              prodectditelImg(
                  index: controller.itemsmodela.itemsId!,
                  itemsm: controller.itemsmodela),
              Container(
                  margin: const EdgeInsets.only(left: 20, top: 18),
                  child: Text(
                    "${controller.itemsmodela.itemsName}",
                    style: const TextStyle(
                        fontSize: 27,
                        color: Appcolor.fourthColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  )),
              prodectprice_cunt(
                addc: () {
                  controller.add(controller.itemsmodela.itemsId);
                },
                count: "${controller.count}",
                min: () {
                  controller.delet(controller.itemsmodela.itemsId);
                },
                price: "${controller.itemsmodela.itemsPrice} \$",
              ),
              Container(
                  margin: const EdgeInsets.only(left: 34, top: 15, right: 34),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      "${controller.itemsmodela.itemsDescreption}${controller.itemsmodela.itemsDescreption}${controller.itemsmodela.itemsDescreption}",
                      style:
                          const TextStyle(fontSize: 17, color: Appcolor.grey),
                      textAlign: TextAlign.start,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  "Colors ",
                  style: TextStyle(
                      fontSize: 22,
                      color: Appcolor.fourthColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        }),
      ),
    );
  }
}
