import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/crud2.dart';
import 'package:e_commerce/linkurl.dart';
import 'package:latlong2/latlong.dart';

class Mapdata {
  Crud2 crud = Crud2();
  Mapdata();

  postdata(LatLng Ending) async {
    var response = await crud.postdata(
        "https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62486a0e8603607c4db387210d945f8537a0&start=35.38244,14.03293&end=${Ending.latitude},${Ending.longitude}");
    print("=====================${Ending.latitude}");
    return response.fold((l) => l, (r) => r);
  }
}
