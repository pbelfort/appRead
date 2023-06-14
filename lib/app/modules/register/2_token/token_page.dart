import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../widgets/buttons/custom_button_widget.dart';
import 'token_controller.dart';

class TokenPage extends GetView<TokenController> {
  const TokenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.h,
        elevation: 0.0,
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
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
                    'Digite o código enviado para seu e-mail.',
                    style: AppTextStyles.textRegular14.merge(
                      const TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PinCodeTextField(
                    textStyle: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    pinTheme: PinTheme(
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.darkGray,
                      selectedColor: AppColors.mediumGray,
                      activeFillColor: Colors.red,
                      selectedFillColor: Colors.red,
                      inactiveFillColor: Colors.red,
                      borderWidth: 1,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10.0),
                      fieldHeight: 60,
                      fieldWidth: 50,
                    ),
                    controller: controller.tokenTextController,
                    appContext: context,
                    length: 6,
                    scrollPadding: const EdgeInsets.all(20),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      TextInputMask(mask: ['999999'])
                    ],
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 45.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Reenviar código',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
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
                      controller.validateToken();
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
