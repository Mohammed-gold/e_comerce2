import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/search.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class search_cont extends GetxController {
  TextEditingController? textEditingController;

  bool search = false;
  @override
  void onInit() {
    textEditingController = TextEditingController();
    super.onInit();
  }

  List<itemsmodel> data = [];
  // itemsmodel itemsm = Get.arguments["itemomdel"];
  Search sh_data = Search();
  StatusReqests statusReqests = StatusReqests.none;
  check(val) {
    if (val == "") {
      search = false;

      update();
    } else {
      data.clear();
      on_searh(val);
      update();
    }
    update();
  }

  check_f(val) {
    if (val == "") {
      search = false;

      update();
    } else {
      data.clear();
      on_searh_f(val);
      update();
    }
    update();
  }

  on_searh(Value) async {
    search = true;
    update();
    statusReqests = StatusReqests.loading;
    update();

    var response = await sh_data.search(Value);
    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        List data2 = response["data"];
        data.clear();
        data.addAll(data2.map(
          (e) => itemsmodel.fromJson(e),
        ));
        update();
      } else if (response['success'] == "false") {
        statusReqests = StatusReqests.failure;
        update();
      }
    }
  }

  on_searh_f(Value) async {
    search = true;
    update();
    statusReqests = StatusReqests.loading;
    update();

    var response = await sh_data.search_f(Value);
    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        List data2 = response["data"];
        data.clear();
        data.addAll(data2.map(
          (e) => itemsmodel.fromJson(e),
        ));
        update();
      } else if (response['success'] == "false") {
        statusReqests = StatusReqests.none;
        update();
      }
    }
  }
}
