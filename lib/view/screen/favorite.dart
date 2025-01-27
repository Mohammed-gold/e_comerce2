import 'package:e_commerce/controller/myfavorite.dart';
import 'package:e_commerce/controller/search.dart';
import 'package:e_commerce/core/class/Handlingdataviwe.dart';
import 'package:e_commerce/core/constant/Appcolor.dart';
import 'package:e_commerce/data/model/appscreenmodel/favorite.dart';
import 'package:e_commerce/view/widgets/favorite/Fav_items.dart';
import 'package:e_commerce/view/widgets/home/custombutton_appbar.dart';
import 'package:e_commerce/view/widgets/home/shearch.dart';
import 'package:e_commerce/view/widgets/search/onsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritec());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: GetBuilder<search_cont>(builder: (cont) {
          return ListView(children: [
            shearch(
              onChanged: (Value) {
                cont.check_f(Value);
              },
              title: 'Find product',
              onnotifcation: () {},
              search: () {
                // controller.on_searh();
              },
              controller: cont.textEditingController!,
            ),
            SizedBox(
              height: 10,
            ),
            cont.search == true
                ? Handlingdataviwe(
                    statusReqests: cont.statusReqests,
                    widget: onsearch(
                      itemsm: cont.data,
                    ))
                : GetBuilder<MyFavoritec>(builder: (control) {
                    return Handlingdataviwe(
                      statusReqests: cont.statusReqests,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: control.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7, crossAxisCount: 2),
                        itemBuilder: (context, index) => Favitemswideget(
                            index: index, favoritemod: control.data[index]),
                      ),
                    );
                  }),
          ]);
        }),
      ),
    );
  }
}
