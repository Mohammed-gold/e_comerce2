// ignore_for_file: file_names

import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Signupsurce {
  Crud crud = Crud();
  Signupsurce();

  postdata(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    var response = await crud.postdata(Appurl.signup, {
      "apiKey": "ce6d33f455a010ea5d55fc7a98ca58ff",
      "name": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    // print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
