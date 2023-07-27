import 'package:get/get.dart';

import 'reading_controller.dart';

class ReadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ReadingController());
  }
}
