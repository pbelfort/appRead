import 'package:app_read/app/modules/login/widgets/form_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.headerColor,
      body: SafeArea(
        child: FormLogin(),
      ),
    );
  }
}
