import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/crud2.dart';
import 'package:e_commerce/linkurl.dart';
import 'package:latlong2/latlong.dart';

class address_data {
  Crud crud = Crud();
  address_data();

  add(String name, String city, String Userid, String lat, String long,
      String Street) async {
    var response = await crud.postdata(Appurl.address_add, {
      "add_name": name,
      "add_city": city,
      "add_usersid": Userid,
      "add_lat": lat,
      "add_long": long,
      "add_street": Street
    });
    return response.fold((l) => l, (r) => r);
  }

  edite(LatLng Ending) async {
    var response = await crud.postdata(
      Appurl.address_edite,
      {},
    );
    print("=====================${Ending.latitude}");
    return response.fold((l) => l, (r) => r);
  }

  delet(int add_id) async {
    var response = await crud.postdata(
      Appurl.address_delet,
      {"add_id": add_id.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  view_add(String Userid) async {
    var response =
        await crud.postdata(Appurl.address_viwe, {"add_usersid": Userid});
    return response.fold((l) => l, (r) => r);
  }
}
