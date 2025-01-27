import 'package:e_commerce/controller/cartc_contro.dart';
import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/cartdata.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/view/screen/cart/cart.dart';

import 'package:get/get.dart';

abstract class ItemsProdectcont extends GetxController {}

class ItemsProdectimp extends ItemsProdectcont {
  itemsmodel itemsmodela = Get.arguments["itemomdel"];
  @override
  void onInit() {
    intdata();

    super.onInit();
  }

  int count = 0;
  Cartdata cartdata = Cartdata();
  Myservicese myservicese = Get.find();

  StatusReqests statusReqests = StatusReqests.none;
  cartadd(var itemsid) async {
    statusReqests = StatusReqests.loading;
    // update();
    var response = await cartdata.cart_add(
        myservicese.sharedPreferences.getString("id")!, itemsid);

    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        Get.snackbar("Alert", "Your prodect add Sucssfully");
        // update();
      }
    } else if (response['success'] == "false") {
      print("false  ====================");
    }

    // update();
  }

  cart_delet(var itemsid) async {
    statusReqests = StatusReqests.loading;
    // update();
    var response = await cartdata.cart_delet(
        myservicese.sharedPreferences.getString("id")!, itemsid);

    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        // update();
        Get.snackbar("Alert", "Your prodect has been remove from cart");
      }
    } else if (response['success'] == "false") {
      print("false  ====================");
    }
  }

  cart_count() async {
    statusReqests = StatusReqests.loading;
    update();
    var response = await cartdata.cart_count(
        myservicese.sharedPreferences.getString("id")!, itemsmodela!.itemsId);

    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        count = response["data"];
        print("===========================================================");
        print("==========================$count");
      }
    }

    update();
  }

  add(itemsid) {
    cartadd(itemsid);

    count++;
    update();
  }

  delet(itemsid) {
    cart_delet(itemsid);
    count == 0 ? count = 0 : count--;
    update();
  }

  intdata() {
    cart_count();
  }
}
