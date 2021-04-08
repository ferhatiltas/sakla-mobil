import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/components/bezier_container.dart';
import '../login/login_view.dart';
import '../../../core/extension/context_extension.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeConfirmPassword = FocusNode();

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPassController = TextEditingController();
  TextEditingController signupConfirmPassController = TextEditingController();

  var keyEmail = GlobalKey<FormFieldState>();
  var keyPass = GlobalKey<FormFieldState>();
  var keyConfirmPass = GlobalKey<FormFieldState>();

  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1E3D),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(child: BezierContainer()),
              Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height / 15,// 7 idi
                    ),
                    buildTitle(),
                    SizedBox(
                      height: context.height / 15,
                    ),
                    buildTextFormFieldForEmail(),
                    SizedBox(
                      height: context.height / 40,
                    ),
                    buildTextFormFieldForPass(),
                    SizedBox(
                      height: context.height / 40,
                    ),
                    buildTextFormFieldForrRePass(),
                    SizedBox(
                      height: context.height / 20,
                    ),
                    buildPrivacyPolicyText(),
                    SizedBox(
                      height: context.height / 30,
                    ),
                    buildSignUpButton(context),
                    SizedBox(
                      height: context.height / 30,
                    ),
                    buildLoginPageButton(context)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Center buildLoginPageButton(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: 'Already have account?',
            style: TextStyle(color: Colors.white, fontSize: 17)),
        TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginView())),
            text: ' Login',
            style: TextStyle(color: Color(0xff7781EB), fontSize: 17)),
      ])),
    );
  }

  Center buildPrivacyPolicyText() {
    return Center(
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
              text: 'By continuing, you agree to our',
              style: TextStyle(color: Colors.white, fontSize: 17)),
          TextSpan(
              text: ' Terms of\n',
              style: TextStyle(color: Color(0xff7781EB), fontSize: 17)),
          TextSpan(
              text: '\Service',
              style: TextStyle(color: Color(0xff7781EB), fontSize: 17)),
          TextSpan(
              text: ' and',
              style: TextStyle(color: Colors.white, fontSize: 17)),
          TextSpan(
              text: ' Privacy Policy',
              style: TextStyle(color: Color(0xff7781EB), fontSize: 17))
        ]),
        textAlign: TextAlign.center,
      ),
    );
  }

  InkWell buildSignUpButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView()));
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
          child: Text('Sign Up',
              style: TextStyle(fontSize: 30, color: Colors.white)),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldForrRePass() {
    return TextFormField(
      key: keyConfirmPass,
      focusNode: myFocusNodeConfirmPassword,
      controller: signupConfirmPassController,
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
        labelText: 'Re-enter password',
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

  TextFormField buildTextFormFieldForPass() {
    return TextFormField(
      key: keyPass,
      focusNode: myFocusNodePassword,
      controller: signupPassController,
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
      controller: signupEmailController,
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
      onTap: () {},
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
        text: 'Sign up',
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
      ),
    ]));
  }
}
