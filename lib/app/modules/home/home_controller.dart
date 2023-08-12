import 'package:app_read/app/domain/user_entity.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final UserEntity? user = Get.arguments['user'];

  void goToAdminPage() {
    print(user!.uuid);
    print('admin page');
  }

  void goToUserBookPage() {
    Get.toNamed(Routes.USER_BOOK);
  }
}
