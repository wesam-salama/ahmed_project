import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/backend/sp_helper.dart';
import 'package:digital_academy/screens/home/homeScreen.dart';
import 'package:digital_academy/screens/login/login.dart';
import 'package:digital_academy/screens/splash/jelloIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AppGet appGet = Get.put(AppGet());
  @override
  void initState() {
    String token = SPHelper.spHelper.getToken();
    var delay = Duration(seconds: 3);
    Future.delayed(delay, () {
      if (token == null || token == '') {
        Get.off(() => Login());
      } else {
        Server.server.getProfile();
        Get.off(() => HomeScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JelloIn(
        duration: Duration(milliseconds: 1500),
        animate: true,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
