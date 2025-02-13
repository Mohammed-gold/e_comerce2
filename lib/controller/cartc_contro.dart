// import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/cartdata.dart';
import 'package:e_commerce/data/model/appscreenmodel/CartModel.dart';
import 'package:e_commerce/data/model/appscreenmodel/CoponModel.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class cartcontroller extends GetxController {
  itemsmodel? itemsmod;
  int count = 0;
  List<CartModel> cartdata_m = [];
  double totprice = 0.0;
  int totcount = 0;
  CoponModel? coponModel;
  int discountCopon = 0;
  var totalPrice = 0.0;
  String? coponName;
  TextEditingController? cobon;
  Cartdata cartdata = Cartdata();

  Myservicese myservicese = Get.find();
  @override
  void onInit() {
    cartdata_m.clear();
    cart_viwe();
    cobon = TextEditingController();
    super.onInit();
    // getfav();
  }

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

    // update();
  }

  cart_count() async {
    statusReqests = StatusReqests.loading;
    update();
    var response = await cartdata.cart_count(
        myservicese.sharedPreferences.getString("id")!, itemsmod!.itemsId);

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

  refreshada() {
    resetdata();
    cart_viwe();
    update();
  }

  resetdata() {
    totprice = 0.0;
    totcount = 0;
    cartdata_m.clear();
  }

  cart_viwe() async {
    statusReqests = StatusReqests.loading;
    update();
    var response = await cartdata
        .cart_viwe(myservicese.sharedPreferences.getString("id")!);

    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['sucsses'] == "true") {
        if (response['tot_co_price'] != false) {
          List data = response["data"];

          Map total = response["tot_co_price"];
          totprice = total["totalprice"]!.toDouble();
          totcount = total["totalcount"]!.toInt();
          cartdata_m.clear();
          cartdata_m.addAll(data.map(((e) => CartModel.fromJson(e))));

          update();
        } else {
          statusReqests = StatusReqests.failure;
          update();
        }
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

    count--;
    update();
  }

  checkCobon() async {
    statusReqests = StatusReqests.loading;
    var response = await cartdata.checkCobon(cobon!.text);
    statusReqests = Handlingdata(response);
    if (statusReqests == StatusReqests.success) {
      if (response['success'] == "true") {
        List copondata = response['data'];
        Map<String, dynamic> copondata2 = copondata[0];
        print(copondata2);
        coponModel = CoponModel.fromJson(copondata2);
        discountCopon = coponModel!.coponDiscount!;
        coponName = coponModel!.coponName;

        update();
      } else {
        coponName = null;
        discountCopon = 0;
        update();
      }
    }
  }

  totaldiscount() {
    return totalPrice = totprice - totprice * discountCopon / 100;
  }
}
