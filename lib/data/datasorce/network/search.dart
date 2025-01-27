import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkurl.dart';

class Search {
  Crud crud = Crud();
  Search();
//
  search(
    itemname,
  ) async {
    var response = await crud.postdata(Appurl.search, {
      "itemsname": itemname,
    });

    return response.fold((l) => l, (r) => r);
  }

  search_f(
    itemname,
  ) async {
    var response = await crud.postdata(Appurl.search_f, {
      "itemsname": itemname,
    });

    return response.fold((l) => l, (r) => r);
  }
}
