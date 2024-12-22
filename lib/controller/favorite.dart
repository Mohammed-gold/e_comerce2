// import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasorce/network/favorite.dart';
import 'package:e_commerce/data/model/appscreenmodel/favorite.dart';
import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:get/get.dart';

class Favoritec extends GetxController {
  Map isfavorite = {};

  setfavorite(var id, var val) {
    print(isfavorite[id]);
    isfavorite[id] = val;
    update();
  }

  Favoritedata favoritedata = Favoritedata();
  itemsmodel it = itemsmodel();

  Myservicese myservicese = Get.find();
  @override
  void onInit() {
    super.onInit();
    // getfav();
  }

  StatusReqests statusReqests = StatusReqests.none;
  addfav(var itemsid) async {
    statusReqests = StatusReqests.loading;
    update();
    var response = await favoritedata.fav_add(
        myservicese.sharedPreferences.getString("id")!, itemsid);

    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        Get.snackbar("Alert", "Your prodect add Sucssfully");
      }
    } else if (response['success'] == "false") {
      print("false  ====================");
    }

    update();
  }

  deletfav(var itemsid) async {
    statusReqests = StatusReqests.loading;
    update();
    var response = await favoritedata.fav_delet(
        myservicese.sharedPreferences.getString("id")!, itemsid);

    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        Get.snackbar("Alert", "Your prodect has been remove from Favorite");
      }
    } else if (response['success'] == "false") {
      print("false  ====================");
    }

    update();
  }
}
