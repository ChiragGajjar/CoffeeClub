import 'dart:async';
import 'package:coffee_club/base/base_stateful_widget.dart';
import 'package:coffee_club/utils/helpers/common_imports.dart';
import 'package:coffee_club/utils/helpers/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulWidgetState<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), () {
      pushNamed(context, AppRoute.productDetails);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {

  }

  @override
  Widget getBodyWidget(Size size) {
    // TODO: implement getBodyWidget
    return const Scaffold(
      body: Center(
        child: Image(
          image:AppImages.appLogo,
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}
