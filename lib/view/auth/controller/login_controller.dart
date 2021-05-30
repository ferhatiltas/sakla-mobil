import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/navigation/navigation_constants.dart';

class LoginController extends GetxController {
  FocusNode myFocusNodeEmail = FocusNode();
  FocusNode myFocusNodePassword = FocusNode();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();

  final keyEmailLogin = GlobalKey<FormFieldState>();
  final keyPassLogin = GlobalKey<FormFieldState>();

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
