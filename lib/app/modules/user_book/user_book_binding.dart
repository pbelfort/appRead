import 'package:get/get.dart';

import '../../data/provider/register/i_user_register_provider.dart';
import '../../data/provider/register/user_register_provider.dart';
import '../../data/repository/register/i_user_register_repository.dart.dart';
import '../../data/repository/register/user_register_repository.dart';
import 'user_book_controller.dart';

class UserBookBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUserRegisterProvider>(() => UserRegisterProvider());
    Get.lazyPut<IUserRegisterRepository>(
      () => UserRegisterRepository(
        provider: Get.find(),
      ),
    );
    Get.put(
      UserBookController(
        userRegisterRepository: Get.find<IUserRegisterRepository>(),
      ),
    );
  }
}
