// ignore_for_file: file_names

import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Verfiysignupremote {
  Crud crud = Crud();
  Verfiysignupremote();

  postdata(
    String verfiycode,
    String email,
  ) async {
    var response = await crud.postdata(Appurl.verfiycode, {
      "verfiycode": verfiycode,
      "email": email,
    });
    // print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
