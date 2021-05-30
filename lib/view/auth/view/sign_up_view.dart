import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakla/services/api_services.dart';
import 'package:sakla/view/auth/controller/sign_up_controller.dart';
import 'package:sakla/view/auth/shared/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/components/bezier_container.dart';
import 'login_view.dart';
import 'package:http/http.dart' as http;

class SignUpView extends StatelessWidget {
  var selectedImage;

  final _controller = Get.put(SignUpController());
  final bringUserInfoAPI=ApiServices();
  var shardPrefs=SharedPrefs();

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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.height / 15,
            ),
            buildTitle(),
            SizedBox(
              height: context.height / 15,
            ),

            buildTextFormFieldForNameAndSurname(),

            buildTextFormFieldForEmail(),

            buildTextFormFieldForPass(),

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
      ),
    );
  }

  Widget buildLoginPageButton(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: 'Already have account?',
            style: TextStyle(color: Colors.white, fontSize: 17)),
        TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginView()));
              },
            text: ' Login',
            style: TextStyle(color: Color(0xff7781EB), fontSize: 17)),
      ])),
    );
  }

  Future selectImage() async {
    final picker = ImagePicker();
    var pickedFile = await picker.getImage(source: ImageSource.gallery);
    selectedImage = pickedFile;
   // createNewUserPost();
  }





  Widget buildPrivacyPolicyText() {
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

  Widget buildSignUpButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        if(
        _controller.keyNameAndSurname.currentState!.validate() &&
        _controller.keyEmail.currentState!.validate() &&
        _controller.keyPass.currentState!.validate() &&
        _controller.keyConfirmPass.currentState!.validate()
        ){
          _controller.keyNameAndSurname.currentState!.save();
          _controller.keyEmail.currentState!.save();
          _controller.keyPass.currentState!.save();
          _controller.keyConfirmPass.currentState!.save();
          if(_controller.signupPassController.text ==_controller.signupConfirmPassController.text){

            bringUserInfoAPI.createNewUserPost(_controller.signupNameAndSurnameController.text.toString(),
                _controller.signupEmailController.text.toString(),
                _controller.signupPassController.text.toString()).then((value) {
              bringUserInfoAPI.bringUserInfoWithEmailSakla(_controller.signupEmailController.text.toString()).then((value) {
                shardPrefs.saveDataPrefs(_controller.signupEmailController.text.toString()).then((value) {
                  _controller.navigateToBaseView();
                });
              });
            });
          }else{
            Get.snackbar('Error', 'Passwords must be equal');
          }
        }

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

  Widget buildTextFormFieldForrRePass() {
    return Obx(() => TextFormField(
          key: _controller.keyConfirmPass,
          controller: _controller.signupConfirmPassController,
          keyboardType: TextInputType.visiblePassword,
          validator: (input) {
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
            labelText: 'Re-enter password',
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

  Widget buildTextFormFieldForPass() {
    return Obx(() => TextFormField(
          key: _controller.keyPass,
          controller: _controller.signupPassController,
          keyboardType: TextInputType.visiblePassword,
          validator: (input) {
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
      controller: _controller.signupEmailController,
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
  Widget buildTextFormFieldForNameAndSurname() {
    return TextFormField(
      key: _controller.keyNameAndSurname,
      controller: _controller.signupNameAndSurnameController,
      keyboardType: TextInputType.name,
      validator: (input) {
        if (input!.length < 4 ) {
          return 'Please enter a valid name and surname !!!';
        }
      },
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        labelText: 'Name and Surname',
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
        text: 'Sign up',
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
      ),
    ]));
  }


}
