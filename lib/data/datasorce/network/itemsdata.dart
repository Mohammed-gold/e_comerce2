import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Itemsdata {
  Crud crud = Crud();
  Itemsdata();

  getItemsdata(int catid, String userid) async {
    var response = await crud.postdata(Appurl.itemss, {
      "cat_id": catid.toString(),
      "id": userid,
      // "apiKey": "ce6d33f455a010ea5d55fc7a98ca58ff"
    });
    // print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
