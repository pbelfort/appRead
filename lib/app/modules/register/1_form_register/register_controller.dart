import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repository/remote/register/i_user_register_repository.dart.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../usecases/register/register_usecases.dart';
import '../../widgets/snackbars/snackbar_mixin.dart';

class RegisterController extends GetxController with SnackbarMixin {
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final RxBool isSpecialChar = false.obs;
  final RxBool isNumeric = false.obs;
  final RxBool isLowerCase = false.obs;
  final RxBool isUpperCase = false.obs;
  final RxBool validPasswordExpression = false.obs;

  final IUserRegisterRepository userRegisterRepository;

  RegisterController({required this.userRegisterRepository});

  void validatePasswordStrength() {
    isSpecialChar.value =
        RegisterUsecases.checkIsSpecialChar(passTextController.text);
    isNumeric.value = RegisterUsecases.checkNumeric(passTextController.text);
    isLowerCase.value =
        RegisterUsecases.checkLowerCase(passTextController.text);
    isUpperCase.value =
        RegisterUsecases.checkUpperCase(passTextController.text);
    validPasswordExpression.value =
        RegisterUsecases.validExpression(passTextController.text);
  }

  Future<void> validateFormRegister() async {
    if (formKeyRegister.currentState!.validate()) {
      final hasRegistered = await RegisterUsecases.register(
        email: emailTextController.text,
        password: passTextController.text,
        userRegisterRepository: userRegisterRepository,
      );
      if (hasRegistered) {
        Get.toNamed(
          Routes.TOKEN,
          parameters: {
            'userEmail': emailTextController.text,
            'password': passTextController.text,
          },
        );
      }
    } else {
      showSnackBar(
        'Ops!',
        'Confira os campos acima e tente novamente!',
        AppColors.red,
        Icons.warning_amber_rounded,
      );
    }
  }
}
