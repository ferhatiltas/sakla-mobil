import 'package:flutter/material.dart';

import '../../core/components/bezier_container.dart';
import '../../core/extension/context_extension.dart';
import 'login/login_view.dart';
import 'signUp/sign_up.dart';

class SplshView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1E3D),
      body: Container(
        height: context.height,
        child: Stack(
          children: [
            Positioned(child: BezierContainer()),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height / 8,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/image/splash.png',
                      height: context.height / 3,
                    ),
                  ),
                  SizedBox(
                    height: context.height / 20,
                  ),
                  Text(
                    'sakla',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Tired of your large files?\nYou are in the right place!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: context.height / 20,
                  ),
                  buildLoginButton(context),
                  SizedBox(
                    height: context.height / 20,
                  ),
                  buildRegisterButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Material buildLoginButton(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(50),
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginView()));
        },
        child: Ink(
          width: context.width / 1.1,
          height: context.height / 16,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff3B4183), Color(0xff515AB6)]),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            color: Color(0xffED7917),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text('Login',
                style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
        ),
      ),
    );
  }

  InkWell buildRegisterButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SignUpView()));
      },
      child: Ink(
        height: context.height / 16,
        width: context.width / 1.1,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff444C99)),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text('Sign Up',
              style: TextStyle(fontSize: 30, color: Colors.white)),
        ),
      ),
    );
  }
}
