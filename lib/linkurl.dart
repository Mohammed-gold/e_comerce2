// ignore_for_file: constant_identifier_names

class Appurl {
  static const Server = "http://192.168.232.90/ecomerce";
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
  static const serveimge = "http://192.168.232.90/images";
  static const items = "$serveimge/items/";
  //app page
  static const itemss = "$Server/items/items.php";
  // favorite
  static const favorite_set = "$Server/favorite/addfavorite.php";
  static const favorite_delete = "$Server/favorite/deletefavorite.php";
  static const myfavorite = "$Server/favorite/myfavorite.php";
  static const removemyfav = "$Server/favorite/removefav.php";
}
