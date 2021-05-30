import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sakla/services/api_services.dart';
import 'package:sakla/view/auth/shared/shared_pref.dart';

import '../../../core/components/bezier_container.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  final _controller = Get.put(LoginController());
  final bringUserInfoAPI = ApiServices();
  var shardPrefs = SharedPrefs();
  var userPassword;
  var responseBodyLength;

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
          key: _controller.keyPassLogin,
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
      key: _controller.keyEmailLogin,
      controller: _controller.loginEmailController,
      keyboardType: TextInputType.emailAddress,
      validator: (String? input) {
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

  Widget buildLoginButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        if (_controller.keyEmailLogin.currentState!.validate() &&
            _controller.keyPassLogin.currentState!.validate()) {
          _controller.keyEmailLogin.currentState!.save();
          _controller.keyPassLogin.currentState!.save();

          bringUserInfoAPI
              .bringUserInfoWithEmailSakla(
                  _controller.loginEmailController.text.toString())
              .then((value) {
            responseBodyLength = bringUserInfoAPI.responseBodyLength;
            userPassword = bringUserInfoAPI.userPassword;

            if (responseBodyLength < 5) {
              Get.snackbar('ERROR', 'Please enter valid email !!!',
                  backgroundColor: Colors.red, colorText: Colors.white);
            } else {
              if (userPassword == _controller.loginPassController.text) {
                shardPrefs
                    .saveDataPrefs(
                        _controller.loginEmailController.text.toString())
                    .then((value) {
                  _controller.navigateToBaseView();
                });
              } else {
                Get.snackbar('ERROR', 'Wrong password entry !!!',
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            }
          });
        }
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

  // Future bringUserInfoWithEmailSakla() async {
  //   int id = 0;
  //
  //   var response = await http.post(
  //       Uri.parse(
  //           'https://expers-68-market-back-end.herokuapp.com/api/v1/bringUserInfoWithEmailSakla/${_controller.loginEmailController.text}'),
  //       body:{
  //         'id': id.toString(),
  //         'name_surname	': 'id.toString()',
  //         'email': 'id.toString()',
  //         'password': 'widget.sessionID.toString()',
  //       } );
  //   print(response.body);
  //   print(response.statusCode);
  //   responseBodyLength=response.body.length;
  //   if(response.body.toString().length>2) {
  //     userPassword = jsonDecode(response.body)[0]['password'].toString();
  //     print(jsonDecode(response.body)[0]['name_surname'].toString());
  //     print(jsonDecode(response.body)[0]['email'].toString());
  //     print(jsonDecode(response.body)[0]['password'].toString());
  //   }
  //
  // }
}
