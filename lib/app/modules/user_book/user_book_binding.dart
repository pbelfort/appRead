import 'package:get/get.dart';

import 'user_book_controller.dart';

class UserBookBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      UserBookController(),
    );
  }
}
