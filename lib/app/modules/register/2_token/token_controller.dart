import 'package:app_read/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TokenController extends GetxController {
  TextEditingController tokenTextController = TextEditingController();

  Future<void> validateToken() async {
    if (tokenTextController.text.length == 6) {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
