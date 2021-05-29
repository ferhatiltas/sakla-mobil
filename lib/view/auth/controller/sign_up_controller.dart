import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final signupEmailController = TextEditingController();
  final signupPassController = TextEditingController();
  final signupConfirmPassController = TextEditingController();

  final keyEmail = GlobalKey<FormFieldState>();
  final keyPass = GlobalKey<FormFieldState>();
  final keyConfirmPass = GlobalKey<FormFieldState>();

  var isPasswordShow = true.obs;
  get isPasswordShows => isPasswordShow.value;
  set isPasswordShows(isPasswordShow) =>
      this.isPasswordShow.value = isPasswordShow;

  void changePasswordIcon() {
    isPasswordShows = !isPasswordShows;
  }
}
