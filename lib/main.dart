import 'package:ecommerce_app/route/route.dart';
import 'package:ecommerce_app/views/splashpage/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: routes, initialRoute: SplashPage().routeName);
  }
}
