import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../widgets/buttons/custom_button_widget.dart';
import '../../widgets/text_form_fields/custom_text_form_field.dart';
import '../login_controller.dart';

class FormLogin extends GetView<LoginController> {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Obx(
          () => controller.showLoading.value
              ? Center(
                  child: Lottie.asset(
                    'lib/app/assets/bookLogo.json',
                    width: 150,
                  ),
                )
              : Form(
                  key: controller.formKeyLogin,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.h),
                          Text(
                            'Acessar sua conta',
                            style: AppTextStyles.textSemiBold16.merge(
                              const TextStyle(color: AppColors.white),
                            ),
                          ),
                          SizedBox(height: 23.h),
                          Stack(
                            children: [
                              Obx(() => CustomTextFormField.email(
                                    textEditingController:
                                        controller.loginTextController,
                                    changeAccount: true,
                                    borderColor: AppColors.backgroundColor,
                                    fillColor: Colors.black,
                                    textInputEnable: true,
                                    textInputUsernameVisible: controller
                                        .textInputUsernameVisible.value,
                                    textInputPasswordVisible: controller
                                        .textInputPasswordVisible.value,
                                    onChanged: (value) {},
                                    keyboardType: TextInputType.emailAddress,
                                    textCapitalization: TextCapitalization.none,
                                    labelText: 'E-mail',
                                    validator: (value) {
                                      return null;
                                    },
                                  )),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            alignment: Alignment.topLeft,
                            child: Obx(
                              () => Visibility(
                                visible: controller.txtEmailWrongVisible.value,
                                child: Text(
                                  controller.messageTextError.value,
                                  style: const TextStyle(color: AppColors.red),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Obx(
                            () => CustomTextFormField.password(
                              textEditingController:
                                  controller.passTextController,
                              changeAccount: true,
                              borderColor: AppColors.backgroundColor,
                              fillColor: Colors.black,
                              textInputEnable: true,
                              textInputUsernameVisible:
                                  controller.textInputPasswordVisible.value,
                              textInputPasswordVisible:
                                  controller.textInputPasswordVisible.value,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (value) {},
                              labelText: 'Senha',
                              validator: (value) {
                                if (value!.isEmpty || value.length < 8) {
                                  return 'A sua senha deve conter no mínimo 8 caracteres.';
                                }
                                return null;
                              },
                              passwordVisible: controller.showPassword.value,
                              onTapPasswordVisible: () {
                                controller.showPassword.value =
                                    !controller.showPassword.value;
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'Esqueceu a senha?',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30.h),
                          CustomButtonWidget(
                            borderRadius: 10,
                            hasIcon: false,
                            height: 40.h,
                            width: Get.width,
                            title: 'Entrar',
                            style: CustomButtonStyle.styleCardGreen,
                            onPressed: () async {
                              if (controller.formKeyLogin.currentState!
                                  .validate()) {
                                await controller.signIn();
                              }
                            },
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
