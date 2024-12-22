import 'package:e_commerce/controller/favorite.dart';
import 'package:e_commerce/core/Services/Servses.dart';
// import 'package:e_commerce/core/Translation/LocalLang.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
// import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/itemsdata.dart';
// import 'package:e_commerce/data/model/appscreenmodel/catogires.dart';
// import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
// import 'package:e_commerce/view/screen/items_prodect.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Itemscont extends GetxController {
  List catogires = [];
  List items = [];
  int? selecteditem;

  // CatogriesModel catogriesModel=CatogriesModel();
  StatusReqests statusReqests = StatusReqests.none;
  Itemsdata itemsdata = Itemsdata();
  changselect(int selected, int catid);
  getitems(int id);
  // gotoitemPr(itemsmodel items_m, index);
  getda(
    int s,
  );
}

class Itemscontim extends Itemscont {
  int cat = 1;
  Myservicese myservicese = Get.find();
  // Favoritec f = Get.put(Favoritec());
  initdata() {
    // var cat = selecteditem;
    // getitems(cat!);
    // f.getfav();
  }

  @override
  void onInit() {
    super.onInit();
    getitems(cat);
    // f.getfav();
    initdata();
  }

  @override
  changselect(selected, catid) {
    selecteditem = selected;
    // cat = catid;
    getitems(catid);
    // f.getfav();
    update();
  }

  @override
  getitems(int id) async {
    items.clear();

    statusReqests = StatusReqests.loading;
    update();
    var response = await itemsdata.getItemsdata(
        id, myservicese.sharedPreferences.getString("id")!);
    // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${response["data"]}");
    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${items}");
        items.addAll(response['data']);
        print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${items}");
        update();
        // print("$response====================");
      } else if (response['success'] == "false") {
        statusReqests = StatusReqests.failure;
      }
    }
    update();
  }

  @override
  // gotoitemPr(itemsmodel items_m, index) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ItemsProdect(index:index ,itemsm: items_m,),
  //       ));
  //   // Get.toNamed(
  //   //   App_root.items_prodect,
  //   //   arguments: {
  //   //     "itemsmodel": items_m,
  //   //   },
  //   // );
  // }

  @override
  getda(
    int s,
  ) {
    // catogires = l;
    selecteditem = s;
    update();
  }
}
