import 'package:get/get.dart';

import '../../data/provider/shared/custom_shared_preferences.dart';
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
    if (await CustomSharedPreferences.getToken != null) {
      return Get.offAllNamed(Routes.HOME);
    }
    return Get.offAllNamed(Routes.LOGIN);
  }
}
