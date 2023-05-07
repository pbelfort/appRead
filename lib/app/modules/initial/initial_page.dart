import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../widgets/buttons/custom_button_widget.dart';
import 'initial_controller.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 250.0),
                  child: Icon(Icons.abc),
                ),
                const Expanded(child: SizedBox.shrink()),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButtonWidget(
                    borderRadius: 10,
                    hasIcon: true,
                    iconData: Icons.arrow_forward_ios_rounded,
                    iconColor: AppColors.headerColor,
                    height: 40.h,
                    width: Get.width,
                    title: 'Criar uma conta',
                    style: CustomButtonStyle.styleCardGreen,
                    onPressed: () {
                      controller.goToRegisterPage();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 20.0),
                  child: CustomButtonWidget(
                    borderRadius: 10,
                    hasIcon: true,
                    iconData: Icons.arrow_forward_ios_rounded,
                    height: 40.h,
                    width: Get.width,
                    title: 'Entrar',
                    style: CustomButtonStyle.styleCardGreen,
                    onPressed: () {
                      controller.goToLoginPage();
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
