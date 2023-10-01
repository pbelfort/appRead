import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/data/repository/remote/child/i_child_repository.dart';
import 'package:app_read/app/domain/child_entity.dart';
import 'package:app_read/app/usecases/child/child_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/shared/custom_shared_preferences.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class AdminController extends IGlobalController {
  final IChildRepository iChildRepository;

  late final String? fatherUuid;
  final childNameController = TextEditingController();
  final childAgeController = TextEditingController();
  List<ChildEntity> childList = <ChildEntity>[];

  AdminController({required this.iChildRepository});

  @override
  Future<void> onInit() async {
    showLoading.value = true;

    fatherUuid = await CustomSharedPreferences.getUuidUser;

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

  Future<void> regiterChild() async {
    showLoading.value = true;
    if (fatherUuid != null) {
      final child = ChildEntity(
        uuidChild: null,
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
          backgroundColor: AppColors.primaryColor,
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
}
