import 'package:app_read/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_text_styles.dart';

abstract class IGlobalController extends GetxController {
  final RxBool showLoading = false.obs;

  Future<bool> showCustomDialog({
    required BuildContext context,
    required String message,
    required Function() yesFunction,
  }) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Você tem certeza?'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'Não',
                  style: AppTextStyles.textRegular12,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  yesFunction();
                },
                child: Text(
                  'Sim',
                  style: AppTextStyles.textRegular12,
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  showCustomSnackbar({
    required String title,
    required String message,
  }) {
    return Get.snackbar(
      title,
      message,
      instantInit: true,
      colorText: AppColors.backgroundColor,
      backgroundColor: AppColors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      icon: const Icon(
        Icons.check,
        color: AppColors.backgroundColor,
      ),
    );
  }
}
