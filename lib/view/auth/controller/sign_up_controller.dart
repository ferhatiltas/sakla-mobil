import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakla/core/constants/navigation/navigation_constants.dart';

class SignUpController extends GetxController {
  final signupEmailController = TextEditingController();
  final signupPassController = TextEditingController();
  final signupConfirmPassController = TextEditingController();
  final signupNameAndSurnameController = TextEditingController();

  final keyEmail = GlobalKey<FormFieldState>();
  final keyPass = GlobalKey<FormFieldState>();
  final keyConfirmPass = GlobalKey<FormFieldState>();
  final keyNameAndSurname = GlobalKey<FormFieldState>();

  var isPasswordShow = true.obs;
  get isPasswordShows => isPasswordShow.value;
  set isPasswordShows(isPasswordShow) =>
      this.isPasswordShow.value = isPasswordShow;

  void changePasswordIcon() {
    isPasswordShows = !isPasswordShows;
  }

  Future<void>? navigateToBaseView() {
    Get.offAllNamed(NavigationConstants.BASE);
  }


}
