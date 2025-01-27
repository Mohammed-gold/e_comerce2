import 'package:e_commerce/binding/intilBinding.dart';
import 'package:e_commerce/core/Services/Servses.dart';
import 'package:e_commerce/core/Translation/LocalLang.dart';
import 'package:e_commerce/core/Translation/Translation.dart';

import 'package:e_commerce/root.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  Myservicese myservicese = Get.put(Myservicese());

  WidgetsFlutterBinding.ensureInitialized();
  await myservicese.myservice();
  myservicese.initilServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //  This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalLang controller = Get.put(LocalLang());
    return GetMaterialApp(
      initialBinding: Intilbinding(),
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: controller.lang,
      title: 'Flutter Demo',
      theme: controller.apptheme,
      getPages: Root,
    );
  }
}
