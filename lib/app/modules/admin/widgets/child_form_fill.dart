import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_colors.dart';
import '../../widgets/buttons/custom_button_widget.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/text_form_fields/custom_text_form_field.dart';
import '../admin_controller.dart';

class ChildFormFillPage extends GetView<AdminController> {
  const ChildFormFillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 1.0,
        ),
        child: Form(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                textEditingController: controller.childNameController,
                changeAccount: true,
                borderColor: AppColors.backgroundColor,
                fillColor: Colors.black,
                textInputEnable: true,
                textInputUsernameVisible: true,
                textInputPasswordVisible: true,
                onChanged: (value) {},
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.none,
                labelText: 'Nome da criança',
                validator: (value) {
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                textEditingController: controller.childAgeController,
                changeAccount: true,
                borderColor: AppColors.backgroundColor,
                fillColor: Colors.black,
                textInputEnable: true,
                textInputUsernameVisible: true,
                textInputPasswordVisible: true,
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                labelText: 'Idade da criança',
                validator: (value) {
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButtonWidget(
                borderRadius: 10,
                hasIcon: false,
                height: 40,
                width: Get.width,
                title: 'Adicionar',
                style: CustomButtonStyle.styleCardGreen,
                onPressed: () async {
                  controller.regiterChild();
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
