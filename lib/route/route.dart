import 'package:ecommerce_app/views/homepage/home_page.dart';
import 'package:ecommerce_app/views/loginpage/login_page.dart';
import 'package:ecommerce_app/views/mainpage/main_page.dart';
import 'package:ecommerce_app/views/product_detail/product_detail.dart';
import 'package:ecommerce_app/views/splashpage/splash_page.dart';

var routes = {
  SplashPage().routeName: (context) => SplashPage(),
  MainPage().routeName: (context) => MainPage(),
  HomePage().routeName: (context) => HomePage(),
  ProductDetailPage().routeName: (context) => ProductDetailPage(),
  LoginPage().routeName: (context) => LoginPage(),
};
