import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../user_book_controller.dart';

class UserBookHeader extends GetView<UserBookController> {
  const UserBookHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.fromLTRB(18, 0, 16, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  controller.child.childName[0].toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Olá ${controller.child.childName}!',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () async {
                    controller.showCustomDialog(
                      context: context,
                      message: 'Deseja realmente sair do aplicativo',
                      yesFunction: () async {
                        await controller.logout();
                      },
                    );
                  },
                  child: const Icon(
                    Icons.logout,
                    color: AppColors.primaryColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 20,
            ),
            child: Obx(() {
              if (controller.showLoading.value) {
                return const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                );
              }

              return Text(
                'Score: ${controller.score ?? 0}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              controller.child.uuidChild,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
