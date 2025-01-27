import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Cartdata {
  Crud crud = Crud();
  Cartdata();
//
  cart_add(id, itemsid) async {
    var response = await crud.postdata(
        Appurl.cart_add, {"id": id.toString(), "items_id": itemsid.toString()});
    print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }

  cart_delet(id, itemsid) async {
    var response = await crud.postdata(Appurl.cart_delet,
        {"id": id.toString(), "items_id": itemsid.toString()});
    print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }

  cart_count(id, itemsid) async {
    var response = await crud.postdata(Appurl.cart_count,
        {"id": id.toString(), "items_id": itemsid.toString()});
    print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }

  cart_viwe(
    id,
  ) async {
    var response = await crud.postdata(Appurl.cart_viwe, {
      "id": id.toString(),
    });
    print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
