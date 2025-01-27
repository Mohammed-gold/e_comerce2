// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservicese extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<Myservicese> myservice() async {
    await Future.delayed(Duration(seconds: 2));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  initilServices() async {
    Get.putAsync(() => Myservicese().myservice());
  }
}
