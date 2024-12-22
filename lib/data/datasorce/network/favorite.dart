import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Favoritedata {
  Crud crud = Crud();
  Favoritedata();
//
  fav_add(id, itemsid) async {
    var response = await crud.postdata(Appurl.favorite_set,
        {"id": id.toString(), "items_id": itemsid.toString()});
    print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }

  fav_delet(id, itemsid) async {
    var response = await crud.postdata(Appurl.favorite_delete,
        {"id": id.toString(), "items_id": itemsid.toString()});
    print("=====================$response");
    return response.fold((l) => l, (r) => r);
  }
}
