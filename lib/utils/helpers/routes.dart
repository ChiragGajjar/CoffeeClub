


import 'package:coffee_club/screens/ProductDetails/product_details.dart';
import 'package:coffee_club/utils/helpers/common_imports.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String splash = "/";
  static const String productDetails = "product_details";



  static Route<dynamic> routes(RouteSettings settings) {
    if (settings.name == productDetails) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return const ProductDetails();
      });
    } else {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        );
      });
    }
  }
}
