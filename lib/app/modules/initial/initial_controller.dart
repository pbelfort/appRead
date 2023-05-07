import 'package:app_read/app/routes/app_pages.dart';
import 'package:get/get.dart';

class InitialController extends GetxController {
  void goToRegisterPage() {
    Get.toNamed(Routes.REGISTER);
  }
}
