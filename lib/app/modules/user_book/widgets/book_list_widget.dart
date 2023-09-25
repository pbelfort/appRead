import 'package:app_read/app/modules/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../user_book_controller.dart';

class BookITems extends GetView<UserBookController> {
  const BookITems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Obx(
            () {
              if (controller.showLoading.value) {
                return const SizedBox.shrink();
              }
              return ListView(
                shrinkWrap: true,
                children: [
                  ...controller.readBookList.map(
                    (quiz) => CustomCardQuizWidget(
                      quiz: quiz,
                      icon: Icons.abc,
                      action: null,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
