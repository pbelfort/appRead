import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/data/repository/remote/child/i_child_repository.dart';
import 'package:app_read/app/domain/child_entity.dart';
import 'package:app_read/app/usecases/child/child_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/shared/custom_shared_preferences.dart';
import '../../data/repository/local/quiz/i_quiz_local_repository.dart';
import '../../data/repository/remote/register/i_user_register_repository.dart.dart';
import '../../routes/app_pages.dart';
import '../../usecases/quiz/quiz_usecases.dart';
import '../../usecases/register/register_usecases.dart';

class AdminController extends IGlobalController {
  final IChildRepository iChildRepository;
  final IQuizLocalRepository iQuizLocalRepository;
  final IUserRegisterRepository userRegisterRepository;

  late final String? fatherUuid;
  int totalChildScore = 0;
  final childNameController = TextEditingController();
  final childAgeController = TextEditingController();
  List<ChildEntity> childList = <ChildEntity>[];

  AdminController({
    required this.iChildRepository,
    required this.iQuizLocalRepository,
    required this.userRegisterRepository,
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

  void goToChildFormFillPage() {
    childNameController.clear();
    childAgeController.clear();
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
        showCustomSnackbar(
          title: 'Criança registrada!',
          message: 'Sua criança foi registrada com sucesso!',
        );
      }
      childList.add(child);
    }

    showLoading.value = false;
  }

  Future<bool> deleteChild(String uuidChild) async {
    showLoading.value = true;
    final childDeleted = await ChildUsecases.deleteChild(
      uuidChild: uuidChild,
      iChildRepository: iChildRepository,
    );
    if (childDeleted) {
      childList.removeWhere((element) => element.uuidChild == uuidChild);

      //update user score
      CustomSharedPreferences.deleteScoreUserInSharedPreferences(
        uuidChild: uuidChild,
      );

      final deletedQuizesFromUserDB =
          await QuizUsecases.deleteChildQuizesFromDB(
        iQuizLocalRepository: iQuizLocalRepository,
        uuidChild: uuidChild,
      );

      if (deletedQuizesFromUserDB) {
        final quizes = await QuizUsecases.getQuizesFromDB(iQuizLocalRepository);

        if (quizes.isNotEmpty) {
          int newQuizesPercent = quizes.length * 100;
          totalChildScore = (((quizes
                          .map((e) => e.grade)
                          .reduce((value, element) => value + element)) /
                      newQuizesPercent) *
                  100)
              .toInt();
        }
      }

      showCustomSnackbar(
        title: 'Criança removida!',
        message: 'Sua criança foi removida com sucesso!',
      );
    }
    showLoading.value = false;
    return childDeleted;
  }

  void goBackToHome() {
    Get.offAllNamed(Routes.HOME);
  }

  goToLoginPage() async {
    final logout = await RegisterUsecases.signOut(
      userRegisterRepository: userRegisterRepository,
    );
    if (logout == 200) {
      CustomSharedPreferences.removeTokenInSharedPreferences();
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
