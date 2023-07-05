import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/app_colors.dart';
import '../../../widgets/text_form_fields/custom_text_form_field.dart';
import '../register_controller.dart';

class FormRegister extends GetView<RegisterController> {
  const FormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKeyRegister,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomTextFormField(
              textEditingController: controller.nameTextController,
              changeAccount: true,
              borderColor: AppColors.backgroundColor,
              fillColor: Colors.black,
              textInputEnable: true,
              textInputPasswordVisible: false,
              textInputUsernameVisible: false,
              onChanged: (value) {},
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              labelText: 'Como gostaria de ser chamado ?',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira um nome válido para ser chamado';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              textEditingController: controller.emailTextController,
              changeAccount: true,
              borderColor: AppColors.backgroundColor,
              fillColor: Colors.black,
              textInputEnable: true,
              textInputPasswordVisible: false,
              textInputUsernameVisible: false,
              onChanged: (value) {},
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              labelText: 'E-mail',
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Insira um e-mail válido';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            CustomTextFormField.password(
              textEditingController: controller.passTextController,
              passwordVisible: true,
              onTapPasswordVisible: () {},
              changeAccount: true,
              textInputPasswordVisible: false,
              textInputUsernameVisible: false,
              borderColor: AppColors.backgroundColor,
              fillColor: Colors.black,
              textInputEnable: true,
              onChanged: (value) {
                controller.validatePasswordStrength();
              },
              keyboardType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.none,
              labelText: 'Digite sua senha novamente',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'O campo senha não pode ser vazio.';
                } else if (value != controller.passTextController.text) {
                  return 'As senhas devem ser iguais.';
                } else if (value.length < 8) {
                  return 'As senhas deve conter no minimo 8 caracteres.';
                }
                return null;
              },
            )
          ]),
        ));
  }
}
