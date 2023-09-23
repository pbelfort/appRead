import 'package:app_read/app/modules/quiz/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_colors.dart';
import '../widgets/custom_app_bar_widget.dart';

enum ChoiceOption {
  optA,
  optB,
  optC,
  optD,
}

class QuizPage extends GetView<QuizController> {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBarWidget(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          Obx(
            () => controller.showLoading.value
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: Lottie.asset(
                          'lib/app/assets/bookLogo.json',
                          width: 150,
                        ),
                      ),
                    ),
                  )
                : SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        ...controller.questions.map((question) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.primaryColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      question.statement,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      question.optA,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    leading: Radio<ChoiceOption>(
                                      fillColor: MaterialStateProperty.all(
                                        AppColors.white,
                                      ),
                                      value: ChoiceOption.optA,
                                      groupValue: controller
                                          .getSelectedOption(question),
                                      onChanged: (ChoiceOption? value) {
                                        controller.selectOption(
                                          question: question,
                                          option: value!,
                                        );
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      question.optB,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    leading: Radio<ChoiceOption>(
                                      fillColor: MaterialStateProperty.all(
                                        AppColors.white,
                                      ),
                                      value: ChoiceOption.optB,
                                      groupValue: controller
                                          .getSelectedOption(question),
                                      onChanged: (ChoiceOption? value) {
                                        controller.selectOption(
                                          question: question,
                                          option: value!,
                                        );
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      question.optC,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    leading: Radio<ChoiceOption>(
                                      fillColor: MaterialStateProperty.all(
                                        AppColors.white,
                                      ),
                                      value: ChoiceOption.optC,
                                      groupValue: controller
                                          .getSelectedOption(question),
                                      onChanged: (ChoiceOption? value) {
                                        controller.selectOption(
                                          question: question,
                                          option: value!,
                                        );
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      question.optD,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    leading: Radio<ChoiceOption>(
                                      fillColor: MaterialStateProperty.all(
                                        AppColors.white,
                                      ),
                                      value: ChoiceOption.optD,
                                      groupValue: controller
                                          .getSelectedOption(question),
                                      onChanged: (ChoiceOption? value) {
                                        controller.selectOption(
                                          question: question,
                                          option: value!,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: Get.width,
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  width: Get.width,
                                  color: AppColors.backgroundColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Obx(() {
                                      return TextButton(
                                        onPressed: !controller
                                                .finishButtonEnabled.value
                                            ? null
                                            : controller.finishQuiz,
                                        style: TextButton.styleFrom(
                                          backgroundColor: !controller
                                                  .finishButtonEnabled.value
                                              ? AppColors.primaryColor
                                                  .withAlpha(50)
                                              : AppColors.primaryColor,
                                          foregroundColor: AppColors.white,
                                        ),
                                        child: const Text('Finalizar'),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
