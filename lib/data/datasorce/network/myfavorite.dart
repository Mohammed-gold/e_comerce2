import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class myFavoritedata {
  Crud crud = Crud();
  myFavoritedata();
//
  favGetdata(
    id,
  ) async {
    var response = await crud.postdata(Appurl.myfavorite, {
      "id": id.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }

  remove(
    id,
  ) async {
    var response = await crud.postdata(Appurl.removemyfav, {
      "id": id.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
