import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Homedata {
  Crud crud = Crud();
  Homedata();

  postdata() async {
    var response = await crud.postdata(Appurl.Home, {});
    // print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
