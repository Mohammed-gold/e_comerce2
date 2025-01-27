// ignore_for_file: unused_import

import 'package:e_commerce/core/constant/root_c.dart';
import 'package:e_commerce/core/middelware/middelware.dart';
import 'package:e_commerce/view/screen/Homescreen.dart';
import 'package:e_commerce/view/screen/address/address_ditailes.dart';
import 'package:e_commerce/view/screen/address/address_viwe.dart';
import 'package:e_commerce/view/screen/auth/Sign_up.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/verfiycodforget.dart';
import 'package:e_commerce/view/screen/auth/verifycode.dart';
import 'package:e_commerce/view/screen/cart/cart.dart';
import 'package:e_commerce/view/screen/homepage.dart';
import 'package:e_commerce/view/screen/items.dart';
import 'package:e_commerce/view/screen/items_prodect.dart';
import 'package:e_commerce/view/screen/address/address_add.dart';

import 'package:e_commerce/view/screen/onBording.dart';
import 'package:e_commerce/view/screen/setting.dart';

import 'package:get/get.dart';

// ignore: non_constant_identifier_names
List<GetPage<dynamic>>? Root = [
  GetPage(
      name: App_root.onbording,
      page: () => const onBording(),
      middlewares: [Middleware()]),
//Address
  GetPage(name: App_root.Addressviwe, page: () => const AddressViwe()),
  GetPage(name: App_root.addressAdd, page: () => AddreAdd()),
  GetPage(name: App_root.addressDitels, page: () => AddressDitailes()),
  //setting
  GetPage(name: App_root.Setting, page: () => const Setting()),

  //cart
  GetPage(name: App_root.Cart, page: () => const Cart()),
  //auth
  GetPage(name: App_root.login, page: () => const Login()),
  GetPage(name: App_root.sigin, page: () => const Sig_up()),
  GetPage(name: App_root.forgetPass, page: () => const ForgetPassword()),
  GetPage(name: App_root.verifycode, page: () => const Verifycode()),
  GetPage(name: App_root.verifycodeforg, page: () => const Verfiycodefoget()),
  //home pages
  GetPage(name: App_root.homepage, page: () => const Homescreen()),
  GetPage(name: App_root.Homescreen, page: () => const Homepage()),
  GetPage(name: App_root.items_prodect, page: () => ItemsProdect())
];
