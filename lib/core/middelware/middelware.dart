// ignore_for_file: implementation_imports

import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class Middleware extends GetMiddleware {
  Myservicese service = Get.put(Myservicese());

  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (service.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: App_root.homepage);
    }
    if (service.sharedPreferences.getString("onbord") == "1") {
      return RouteSettings(name: App_root.login);
    }
    return null;
  }
}
