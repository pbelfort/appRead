import 'package:app_read/app/modules/reading/reading_controller.dart';
import 'package:app_read/app/modules/widgets/custom_app_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';

class ReadingPage extends GetView<ReadingController> {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(color: AppColors.backgroundColor),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.bookTitle!.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Center(
                    child: Text(
                      controller.bookDescription!,
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => controller.goToQuizPage(),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.white,
                ),
                child: const Text('Quiz'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
