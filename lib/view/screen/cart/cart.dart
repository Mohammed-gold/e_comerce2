import 'package:e_commerce/controller/cartc_contro.dart';
import 'package:e_commerce/controller/myfavorite.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/constant/images.dart';
import 'package:e_commerce/data/model/appscreenmodel/favorite.dart';
import 'package:e_commerce/linkurl.dart';
import 'package:e_commerce/view/widgets/cartwidget/cart_appbar.dart';
import 'package:e_commerce/view/widgets/cartwidget/cart_bottomAppbar.dart';
import 'package:e_commerce/view/widgets/cartwidget/cart_count.dart';
import 'package:e_commerce/view/widgets/cartwidget/cart_items.dart';
import 'package:e_commerce/view/widgets/favorite/Fav_items.dart';
import 'package:e_commerce/view/widgets/home/custombutton_appbar.dart';
import 'package:e_commerce/view/widgets/home/shearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(cartcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
      ),
      bottomNavigationBar: GetBuilder<cartcontroller>(builder: (controller) {
        return cart_bottomAppbar(
          cobon_onPress: () {
            controller.checkCobon();
          },
          cobon_text_con: controller.cobon!,
          discount: "${controller.discountCopon}%",
          Price: "${controller.totprice}",
          Shipping: "100",
          totalPrice: "900",
        );
      }),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GetBuilder<cartcontroller>(builder: (cont) {
          return Handlingdataviwe(
              statusReqests: cont.statusReqests,
              widget: ListView(children: [
                // cart_appbar(),
                SizedBox(
                  height: 40,
                ),
                cart_count(
                  count: cont.totcount,
                ),
                ...List.generate(
                  cont.cartdata_m.length,
                  (i) => cart_items(
                    onadd: () async {
                      await cont.add(cont.cartdata_m[i].cartItemsId);
                      await Future.delayed(Duration(seconds: 1));
                      cont.refreshada();
                    },
                    onmin: () async {
                      await cont.delet(cont.cartdata_m[i].cartItemsId);
                      await Future.delayed(Duration(seconds: 1));
                      cont.refreshada();
                    },
                    cartName: "${cont.cartdata_m[i].itemsName}",
                    count: cont.cartdata_m[i].itemscount,
                    image: "${Appurl.items}${cont.cartdata_m[i].itemsImage}",
                    price: cont.cartdata_m[i].itemsPrice,
                  ),
                )
              ]));
        }),
      ),
    );
  }
}
