import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../../core/components/bezier_container.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1E3D),
      body: SingleChildScrollView(
        child: Container(
          height: context.height,
          child: Stack(
            children: [
              Positioned(child: BezierContainer()),
              buildBody(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height / 5,
          ),
          buildTitle(),
          SizedBox(
            height: context.height / 15,
          ),
          buildTextFormFieldForEmail(),
          SizedBox(
            height: context.height / 40,
          ),
          buildTextFormFieldForPassword(context),
          SizedBox(
            height: context.height / 40,
          ),
          buildForgetPassButton(),
          SizedBox(
            height: context.height / 20,
          ),
          buildLoginButton(context)
        ],
      ),
    );
  }

  Widget buildForgetPassButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {},
          child: Text(
            '',
            style: TextStyle(fontSize: 20, color: Color(0xff7781EB)),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: 'sakla\n',
        style: TextStyle(
            color: Color(0xff555EBD),
            fontSize: 50,
            fontWeight: FontWeight.w600),
      ),
      TextSpan(
        text: 'Welcome back!',
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
      ),
    ]));
  }

  Widget buildTextFormFieldForPassword(BuildContext context) {
    return Obx(() => TextFormField(
          key: _controller.keyPass,
          controller: _controller.loginPassController,
          keyboardType: TextInputType.visiblePassword,
          validator: (String? input) {
            if (input!.length < 6) {
              return 'Your password must be at least 6 digits !!!';
            }
          },
          cursorColor: Colors.white,
          obscureText: _controller.isPasswordShows,
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
            suffix: IconButton(
              icon: Icon(
                _controller.isPasswordShows
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: () {
                _controller.changePasswordIcon();
              },
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff404993)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ));
  }

  Widget buildTextFormFieldForEmail() {
    return TextFormField(
      key: _controller.keyEmail,
      controller: _controller.loginEmailController,
      keyboardType: TextInputType.emailAddress,
      validator: (String? input) {
        if (input!.isEmail) {
          return 'Please enter a valid email address !!!';
        }
      },
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff404993)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        _controller.navigateToBaseView();
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
    );
  }
}
