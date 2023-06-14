import 'package:app_read/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_colors.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.backgroundColor),
      child: Center(
        child: Center(
          child: Lottie.asset(
            'lib/app/assets/bookLogo.json',
            width: 150,
          ),
        ),
      ),
    );
  }
}
