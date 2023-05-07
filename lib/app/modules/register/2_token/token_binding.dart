import 'package:get/get.dart';

import 'token_controller.dart';

class TokenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TokenController());
  }
}
