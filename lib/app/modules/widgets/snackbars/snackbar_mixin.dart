import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_colors.dart';

mixin SnackbarMixin on GetxController {
  void showSnackBar(
    String title,
    String message,
    Color backColor,
    IconData iconData,
  ) {
    Get.snackbar(
      title,
      message,
      instantInit: true,
      colorText: AppColors.white,
      backgroundColor: backColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(16),
      icon: Icon(
        iconData,
        color: AppColors.white,
      ),
    );
  }
}
