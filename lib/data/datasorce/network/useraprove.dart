import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Useraprove {
  Crud crud= Crud();
  Useraprove();

  postdata(String email,) async {
    var response = await crud.postdata(Appurl.useraprove, {
      "email":email,
    });
    // print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
