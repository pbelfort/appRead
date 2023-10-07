import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/data/repository/remote/child/i_child_repository.dart';
import 'package:app_read/app/domain/child_entity.dart';
import 'package:app_read/app/usecases/child/child_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/shared/custom_shared_preferences.dart';
import '../../data/repository/local/quiz/i_quiz_local_repository.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../usecases/quiz/quiz_usecases.dart';
import '../widgets/dialogs/custom_dialog.dart';

class AdminController extends IGlobalController {
  final IChildRepository iChildRepository;
  final IQuizLocalRepository iQuizLocalRepository;

  late final String? fatherUuid;
  int totalChildScore = 0;
  final childNameController = TextEditingController();
  final childAgeController = TextEditingController();
  List<ChildEntity> childList = <ChildEntity>[];

  AdminController({
    required this.iChildRepository,
    required this.iQuizLocalRepository,
  });

  @override
  Future<void> onInit() async {
    showLoading.value = true;

    fatherUuid = await CustomSharedPreferences.getUuidUser;

    final quizes = await QuizUsecases.getQuizesFromDB(iQuizLocalRepository);

    if (quizes.isNotEmpty) {
      int quizesPercent = quizes.length * 100;
      totalChildScore = (((quizes
                      .map((e) => e.grade)
                      .reduce((value, element) => value + element)) /
                  quizesPercent) *
              100)
          .toInt();
    }
    if (fatherUuid != null) {
      childList = await ChildUsecases.getChildsFromFatherUuid(
        fatherUuid: fatherUuid!,
        iChildRepository: iChildRepository,
      );
    }
    showLoading.value = false;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    childNameController.clear();
    childAgeController.clear();

    super.onReady();
  }

  void goToChildFormFillPage() {
    Get.toNamed(Routes.CHILD_FORM_FILL);
  }

  String evolutionText() {
    if (totalChildScore < 30) return 'As crianças precisam de ler mais livros';
    if (totalChildScore > 30 && totalChildScore < 60) {
      return 'As crianças estão indo bem, mas precisam melhorar';
    }
    if (totalChildScore > 60 && totalChildScore < 80) {
      return 'Muito bem... As crianças estão aprendendo bastante';
    }
    return 'O nível de aprendizado está excelente! Continuem assim! :)';
  }

  Future<void> regiterChild() async {
    showLoading.value = true;
    if (fatherUuid != null) {
      final child = ChildEntity(
        uuidChild: '',
        childName: childNameController.text,
        age: int.parse(childAgeController.text),
        fatherUuid: fatherUuid!,
        score: 0,
      );
      final childRegistered = await ChildUsecases.registerChild(
        child: child,
        iChildRepository: iChildRepository,
      );

      if (childRegistered) {
        Get.back();
        Get.snackbar(
          'Criança registrada!',
          'Sua criança foi registrada com sucesso!',
          instantInit: true,
          colorText: AppColors.white,
          backgroundColor: const Color.fromARGB(255, 51, 27, 20),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 4),
          margin: const EdgeInsets.all(16),
          icon: const Icon(
            Icons.check,
            color: AppColors.white,
          ),
        );
      }
      childList.add(child);
    }

    showLoading.value = false;
  }

  Future<bool> showCustomDialog({
    required BuildContext context,
    required String message,
    required Function() yesFunction,
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => CustomAlertDialog(
        title: message,
        yesFunction: yesFunction,
      ),
    ).then((value) => true);
  }

  Future<bool> deleteChild(String uuidChild) async {
    showLoading.value = true;
    final childDeleted = await ChildUsecases.deleteChild(
      uuidChild: uuidChild,
      iChildRepository: iChildRepository,
    );
    if (childDeleted) {
      childList.removeWhere((element) => element.uuidChild == uuidChild);
      Get.snackbar(
        'Criança removida!',
        'Sua criança foi removida com sucesso!',
        instantInit: true,
        colorText: AppColors.white,
        backgroundColor: const Color.fromARGB(255, 51, 27, 20),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(16),
        icon: const Icon(
          Icons.check,
          color: AppColors.white,
        ),
      );
    }
    showLoading.value = false;
    return childDeleted;
  }
}
