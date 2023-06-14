import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class HomeCardWidget extends StatelessWidget {
  final Function()? cardFunctionCalback;
  final IconData cardWidgetIcon;
  final String cardTitle;
  const HomeCardWidget({
    super.key,
    required this.cardFunctionCalback,
    required this.cardWidgetIcon,
    required this.cardTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: cardFunctionCalback,
              child: SizedBox(
                width: Get.width / 3,
                height: 100,
                child: Center(
                  child: Text(
                    cardTitle,
                    style: AppTextStyles.textLight18Primary,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 50,
          bottom: 80,
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              cardWidgetIcon,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
