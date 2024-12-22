import 'package:e_commerce/data/model/appscreenmodel/itemsmodel.dart';

import 'package:get/get.dart';

abstract class ItemsProdect extends GetxController {
  late itemsmodel itemsmodela;
  // late int index;
  intdata();
}

class ItemsProdectimp extends ItemsProdect {
  @override
  void onInit() {
    intdata();
    super.onInit();
  }

  @override
  intdata() {
    itemsmodela = Get.arguments["itemsmodel"];
  }
}
