import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Logindata {
  Crud crud = Crud();
  Logindata();

  postdata(
    String password,
    String email,
  ) async {
    var response = await crud.postdata(Appurl.login, {
      "email": email,
      "password": password,
    });
    // print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
