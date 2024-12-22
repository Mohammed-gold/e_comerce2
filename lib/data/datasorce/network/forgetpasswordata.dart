import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Forgetpasswordata {
  Crud crud= Crud();
  Forgetpasswordata();

  postdata(String email,) async {
    var response = await crud.postdata(Appurl.ForgetPasswordc, {
    "email":email,
    });
    // print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
