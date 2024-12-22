import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Verfiyforgetre {
  Crud crud= Crud();
  Verfiyforgetre();

  postdata(String verfiycode,String email,) async {
    var response = await crud.postdata(Appurl.verfiycodeforgetpas, {
      "verfiycode":verfiycode,"email":email,
    });
    // print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
