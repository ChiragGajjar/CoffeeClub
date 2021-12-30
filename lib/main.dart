import 'package:coffee_club/screens/Authentication/Splash/splash.dart';
import 'package:coffee_club/utils/helpers/common_imports.dart';
import 'package:coffee_club/utils/helpers/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//Testing
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        color: AppColors.black,
        initialRoute: "/",
        onGenerateRoute: AppRoute.routes,
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
