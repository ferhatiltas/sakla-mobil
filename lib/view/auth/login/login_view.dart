import 'package:flutter/material.dart';
import 'package:sakla/view/baseView/base_view.dart';

import '../../../core/components/bezier_container.dart';
import '../../../core/extension/context_extension.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();

  var keyEmail = GlobalKey<FormFieldState>();
  var keyPass = GlobalKey<FormFieldState>();

  bool isPasswordShow = true;

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
              Padding(
                padding: context.paddingNormal,
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
                    buildTextFormFieldForPassword(),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Align buildForgetPassButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: () {},
          child: Text(
            'Forget Password?',
            style: TextStyle(fontSize: 20, color: Color(0xff7781EB)),
          ),
        ),
      ),
    );
  }

  Text buildTitle() {
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

  TextFormField buildTextFormFieldForPassword() {
    return TextFormField(
      key: keyPass,
      focusNode: myFocusNodePassword,
      controller: loginPassController,
      keyboardType: TextInputType.visiblePassword,
      validator: (input) {
        if (input!.length < 6) {
          return 'Your password must be at least 6 digits !!!';
        }
      },
      cursorColor: Colors.white,
      obscureText: isPasswordShow,
      style: TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        suffix: IconButton(
          icon: Icon(
            isPasswordShow ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isPasswordShow = !isPasswordShow;
            });
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
    );
  }

  TextFormField buildTextFormFieldForEmail() {
    return TextFormField(
      key: keyEmail,
      focusNode: myFocusNodeEmail,
      controller: loginEmailController,
      keyboardType: TextInputType.emailAddress,
      validator: (input) {
        if (input!.length < 4 || !input.contains('@') || !input.contains('.')) {
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

  InkWell buildLoginButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
     Navigator.push(context, MaterialPageRoute(builder: (_) => BaseView()));
      },
      child: Ink(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 16,
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
