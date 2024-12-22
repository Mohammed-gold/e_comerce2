// import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';
import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';

import 'package:e_commerce/data/datasorce/network/myfavorite.dart';
import 'package:e_commerce/data/model/appscreenmodel/favorite.dart';

import 'package:get/get.dart';

class MyFavoritec extends GetxController {
  List<favoritemodel> data = [];

  myFavoritedata favoritedata = myFavoritedata();

  Myservicese myservicese = Get.find();
  @override
  void onInit() {
    getFavData();
    super.onInit();
    // getfav();
  }

  StatusReqests statusReqests = StatusReqests.none;
  getFavData() async {
    data.clear();
    statusReqests = StatusReqests.loading;
    update();
    var response = await favoritedata.favGetdata(
      myservicese.sharedPreferences.getString("id")!,
    );

    statusReqests = Handlingdata(response);
    if (StatusReqests.success == statusReqests) {
      if (response['success'] == "true") {
        List fav = response["data"];
        data.addAll(fav.map((e) => favoritemodel.fromJson(e)));
        print(data);
      }
    } else if (response['success'] == "false") {
      statusReqests = StatusReqests.failure;
      print("false  ====================");
    }

    update();
  }

  removeFav(id) async {
    var response = await favoritedata.remove(
      id,
    );

    data.removeWhere(
      (element) => element.favId == id,
    );
    print(data);

    update();
  }
}
