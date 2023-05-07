import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../login_controller.dart';

class UsernameInputWidget extends GetView<LoginController> {
  const UsernameInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          controller: controller.loginTextController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelStyle:
                TextStyle(color: const Color(0xFFB2B1B2), fontSize: 16.h),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: controller.txtEmailWrongVisible.value
                        ? Colors.red
                        : const Color(0xFF5D5B5C),
                    width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: controller.txtEmailWrongVisible.value
                      ? Colors.red
                      : const Color(0xffE2E1E2),
                  width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: "E-mail ou telefone",
          ),
          obscureText: false,
          validator: (value) {
            return null;
          },
        ));
  }
}
