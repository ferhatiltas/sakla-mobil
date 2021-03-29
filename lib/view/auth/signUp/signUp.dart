import 'package:flutter/material.dart';
import 'package:sakla/core/components/bezier_container.dart';
import 'package:sakla/view/auth/login/login_view.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(child: BezierContainer()),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Text(
                    'sakla',
                    style: TextStyle(
                        color: Color(0xff555EBD),
                        fontSize: 50,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  TextFormField(
                    key: keyEmail,
                    focusNode: myFocusNodeEmail,
                    controller: signupEmailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (girilenDeger) {
                      if (girilenDeger!.length < 4 ||
                          !girilenDeger.contains('@') ||
                          !girilenDeger.contains('.')) {
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  TextFormField(
                    key: keyPass,
                    focusNode: myFocusNodePassword,
                    controller: signupPassController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (girilenDeger) {
                      if (girilenDeger!.length < 6) {
                        return 'Your password must be at least 6 digits !!!';
                      }
                    },
                    cursorColor: Colors.white,
                    obscureText: isPasswordShow,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      suffix: IconButton(
                        icon: Icon(
                          isPasswordShow
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  TextFormField(
                    key: keyConfirmPass,
                    focusNode: myFocusNodeConfirmPassword,
                    controller: signupConfirmPassController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (girilenDeger) {
                      if (girilenDeger!.length < 6) {
                        return 'Your password must be at least 6 digits !!!';
                      }
                    },
                    cursorColor: Colors.white,
                    obscureText: isPasswordShow,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      suffix: IconButton(
                        icon: Icon(
                          isPasswordShow
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginView()));
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
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
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
}
