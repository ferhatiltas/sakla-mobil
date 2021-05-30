import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sakla/core/components/bezier_container.dart';
import 'package:sakla/core/constants/navigation/navigation_constants.dart';
import 'package:sakla/view/auth/controller/login_controller.dart';
import 'package:sakla/view/auth/shared/shared_pref.dart';
import 'package:sakla/view/auth/view/splash_view.dart';
import 'package:sakla/view/baseView/base_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = Get.put(LoginController());
  final sharedPrefs = SharedPrefs();
  var userEmail;

  @override
  void initState() {
    super.initState();

    sharedPrefs.bringSharedPrefs().then((value) {
      userEmail = sharedPrefs.userEmail.toString();
      print(userEmail.toString());

      if (userEmail == null) {
        return SplashView();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.done) {
            return BaseView();
          } else
           {
            return Scaffold(
              backgroundColor: Color(0xff1C1E3D),
              body: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(child: BezierContainer()),
                    buildBody(context)
                  ],
                ),
              ),
            );
          }
        });
  }


  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Center(
            child: Image.asset(
              'assets/image/splash.png',
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Text(
            'sakla',
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w500),
          ),
          Text(
            'Tired of your large files?\nYou are in the right place!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
