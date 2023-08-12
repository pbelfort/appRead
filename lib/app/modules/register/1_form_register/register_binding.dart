import 'package:app_read/app/modules/register/1_form_register/register_controller.dart';
import 'package:get/get.dart';

import '../../../data/provider/register/i_user_register_provider.dart';
import '../../../data/provider/register/user_register_provider.dart';
import '../../../data/repository/register/i_user_register_repository.dart.dart';
import '../../../data/repository/register/user_register_repository.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUserRegisterProvider>(() => UserRegisterProvider());
    Get.lazyPut<IUserRegisterRepository>(
      () => UserRegisterRepository(
        provider: Get.find(),
      ),
    );
    Get.put(RegisterController(
        userRegisterRepository: Get.find<IUserRegisterRepository>()));
  }
}
