import 'package:app_read/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  void goToAdminPage() {
    Get.toNamed(Routes.ADMIN);
  }

  void goToUserBookPage() {
    Get.toNamed(Routes.USER_BOOK);
  }
}
