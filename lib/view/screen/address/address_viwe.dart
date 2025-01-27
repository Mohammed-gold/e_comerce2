import 'package:e_commerce/controller/Address/address_add_cont.dart';
import 'package:e_commerce/controller/Address/address_view.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/class/statusReqest.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/core/constant/root_c.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressViwe extends StatelessWidget {
  const AddressViwe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressView_cont());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.primaryColor,
        onPressed: () {
          Get.offAllNamed(App_root.addressAdd);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Appcolor.primaryColor),
        title: Text(
          "Address",
          style: TextStyle(
              color: Appcolor.primaryColor,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<AddressView_cont>(builder: (cont) {
        return Handlingdataviwe(
            statusReqests: cont.statusReqests,
            widget: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: cont.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(cont.data[index]['add_name']),
                      subtitle: Text(
                          "${cont.data[index]['add_city']} , ${cont.data[index]['add_street']}"),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Appcolor.primaryColor,
                        ),
                        onPressed: () {
                          cont.deletaddress(cont.data[index]['add_id']);
                        },
                      ),
                    ),
                  );
                },
              ),
            ));
      }),
    );
  }
}
