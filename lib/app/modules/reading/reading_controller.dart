import 'package:app_read/app/base/custom_controller.dart';
import 'package:app_read/app/domain/book_entity.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReadingController extends ICustomController {
  final BookEntity book = Get.arguments['book'];
  @override
  Future<void> onInit() async {
    // await setLandScapeDeviceOrientation();
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    //await setPortraitDeviceOrientation();
    super.onClose();
  }

  void goToQuizPage() {
    Get.toNamed(
      Routes.QUIZ,
      parameters: {'uuidBook': book.uuidBook},
    );
  }

  Future<void> setPortraitDeviceOrientation() async {
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
  }

  Future<void> setLandScapeDeviceOrientation() async {
    showLoading.value = true;
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    await 3.delay();
    showLoading.value = false;
  }
}
