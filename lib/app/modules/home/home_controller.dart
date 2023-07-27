import 'package:app_read/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  void goToAdminPage() {
    print('admin page');
  }

  void goToUserBookPage() {
    Get.toNamed(Routes.USER_BOOK);
  }
}
