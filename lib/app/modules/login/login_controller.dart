import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:app_read/app/usecases/register/register_usecases.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/provider/shared/custom_shared_preferences.dart';
import '../../data/repository/remote/register/i_user_register_repository.dart.dart';

class LoginController extends IGlobalController {
  final IUserRegisterRepository userRegisterRepository;
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

  LoginController({required this.userRegisterRepository});

  Future<void> signIn() async {
    showLoading.value = true;
    final user = await RegisterUsecases.signIn(
      email: loginTextController.text,
      password: passTextController.text,
      userRegisterRepository: userRegisterRepository,
    );

    if (user != null) {
      CustomSharedPreferences.saveTokenInSharedPreferences(
        token: user.token,
      );
      CustomSharedPreferences.saveUuidUserInSharedPreferences(
        uuid: user.uuid,
      );
      showLoading.value = false;
      Get.toNamed(Routes.HOME, arguments: {"user": user});
    }
    showLoading.value = false;
  }
}
