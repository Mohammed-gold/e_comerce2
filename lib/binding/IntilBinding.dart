// ignore_for_file: file_names

import 'package:e_commerce/controller/auth/Sign_up_co.dart';
import 'package:e_commerce/controller/favorite.dart';
import 'package:e_commerce/controller/itemscont.dart';
import 'package:e_commerce/core/class/Crud.dart';

import 'package:get/get.dart';

class Intilbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    // Get.put(Favoritec());
    // Get.put(Itemscontim());
    Get.lazyPut(() => SignUpcontim(), fenix: true);
  }
}
