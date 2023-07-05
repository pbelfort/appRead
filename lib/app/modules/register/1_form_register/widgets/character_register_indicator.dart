import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import '../register_controller.dart';

class CharacterPasswordIndicator extends StatelessWidget {
  const CharacterPasswordIndicator(
      {super.key, required this.registerController});
  final RegisterController registerController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
      child: Obx(
        (() => Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 20,
                      color: registerController.isUpperCase.value
                          ? AppColors.red
                          : AppColors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Letra maiúscula  ',
                      style: AppTextStyles.textLight14.merge(
                        const TextStyle(fontSize: 16, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 20,
                      color: registerController.isLowerCase.value
                          ? AppColors.red
                          : AppColors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Letra minúscula  ',
                      style: AppTextStyles.textLight14.merge(
                        const TextStyle(fontSize: 16, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 20,
                      color: registerController.isNumeric.value
                          ? AppColors.red
                          : AppColors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Numérico  ',
                      style: AppTextStyles.textLight14.merge(
                        const TextStyle(fontSize: 16, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 20,
                      color: registerController.isSpecialChar.value
                          ? AppColors.red
                          : AppColors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Caracter especial  ',
                      style: AppTextStyles.textLight14.merge(
                        const TextStyle(fontSize: 16, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
