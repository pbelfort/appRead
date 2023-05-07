import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  // Form login
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final loginTextController = TextEditingController();
  final passTextController = TextEditingController();
  RxBool textInputUsernameVisible = false.obs;
  RxBool textInputPasswordVisible = false.obs;
  RxBool txtPasswordWrongVisible = false.obs;
  RxBool txtEmailWrongVisible = false.obs;
  RxBool showPassword = true.obs;
  RxString messageTextError = ''.obs;

  var isSignUpComplete = false.obs;
  RxString verificationCode = ''.obs;
  RxBool keepConnected = false.obs;
  final loading = false.obs;
}
