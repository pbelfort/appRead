import 'package:get/get.dart';

import 'library_controller.dart';

class LibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      LibraryController(),
    );
  }
}
