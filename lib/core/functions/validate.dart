import 'package:get/get.dart';

valdinput(String val, int min, int max, type) {
  if (val.isEmpty) {
    return "52".tr;
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "47".tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "48".tr;
    }
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "49".tr;
    }
  }
  if (val.length < min) {
    return "${"50".tr}$min";
  }
  if (val.length > max) {
    return "${"51".tr}$max";
  }
}
