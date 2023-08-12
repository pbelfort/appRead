import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    _loading();
    super.onReady();
  }

  // ignore: always_declare_return_types
  _loading() async {
    await 2.5.delay();
    return Get.offAllNamed(Routes.LOGIN);
  }
}
