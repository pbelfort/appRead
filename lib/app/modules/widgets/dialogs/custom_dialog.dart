import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Function() yesFunction;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.yesFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(title),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text(
            'Não',
            style: TextStyle(color: AppColors.black),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(),
          onPressed: () {
            yesFunction();
            Get.back();
          },
          child: const Text(
            'Sim',
            style: TextStyle(color: AppColors.black),
          ),
        )
      ],
    );
  }
}
