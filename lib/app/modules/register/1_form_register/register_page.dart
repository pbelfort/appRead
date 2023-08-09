import 'package:app_read/app/modules/register/1_form_register/register_controller.dart';
import 'package:app_read/app/modules/register/1_form_register/widgets/form_register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../widgets/buttons/custom_button_widget.dart';
import 'widgets/character_register_indicator.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Icon(Icons.abc),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Criar uma conta',
                      style: AppTextStyles.textBold19.merge(
                        const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 60.0),
                    child: Text(
                      'Para iniciar o cadastro, digite os dados solicitados.',
                      style: AppTextStyles.textRegular14.merge(
                        const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  const FormRegister(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CharacterPasswordIndicator(
                    registerController: controller,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButtonWidget(
                      borderRadius: 10,
                      hasIcon: false,
                      iconData: Icons.arrow_forward_ios_rounded,
                      iconColor: AppColors.headerColor,
                      height: 45.h,
                      width: Get.width,
                      title: 'Seguinte',
                      style: CustomButtonStyle.styleGreenRounded,
                      onPressed: () {
                        controller.validateFormRegister();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
