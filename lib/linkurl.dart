// ignore_for_file: constant_identifier_names

class Appurl {
  static const Servera = "http://192.168.184.90";
  static const Server = "$Servera/ecomerce";
  // static const Server = "https://seashell-frog-671080.hostingersite.com/api";

  // ===============Auth==========//
  static const Home = "$Server/home.php";
  static const signup = "$Server/create-user";
  static const verfiycode = "$Server/auth/verfiycode.php";
  static const verfiycodeforgetpas =
      "$Server/auth/forgetpassword/verfiycodech.php";
  static const ForgetPasswordc = "$Server/auth/forgetpassword/checkemail.php";
  static const useraprove = "$Server/auth/useraprove.php";
  static const login = "$Server/auth/login.php";
  // imag
  static const serveimge = "$Servera/images";
  static const items = "$serveimge/items/";
  //app page
  static const itemss = "$Server/items/items.php";
  // favorite
  static const favorite_set = "$Server/favorite/addfavorite.php";
  static const favorite_delete = "$Server/favorite/deletefavorite.php";
  static const myfavorite = "$Server/favorite/myfavorite.php";
  static const removemyfav = "$Server/favorite/removefav.php";
  //cart
  static const cart_add = "$Server/cart/cart_add.php";
  static const cart_delet = "$Server/cart/cart_delet.php";
  static const cart_count = "$Server/cart/cart_count.php";
  static const cart_viwe = "$Server/cart/cart_viwe.php";
//search
  static const search = "$Server/search.php";
  static const search_f = "$Server/search_f.php";
  // address
  static const address_add = "$Server/address/add.php";
  static const address_delet = "$Server/address/delet.php";
  static const address_edite = "$Server/address/edite.php";
  static const address_viwe = "$Server/address/viwe.php";
  //cobon
  static const cobon = "$Server/cobon/cobon_check.php";
}
