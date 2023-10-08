import 'package:app_read/app/data/provider/remote/register/i_user_register_provider.dart';
import 'package:app_read/app/data/provider/remote/register/user_register_provider.dart';
import 'package:app_read/app/data/repository/remote/register/i_user_register_repository.dart.dart';
import 'package:app_read/app/data/repository/remote/register/user_register_repository.dart';
import 'package:get/get.dart';

import '../../data/provider/local/quiz/i_quiz_local_provider.dart';
import '../../data/provider/local/quiz/quiz_local_provider.dart';
import '../../data/provider/remote/child/child_provider.dart';
import '../../data/provider/remote/child/i_child_provider.dart';
import '../../data/repository/local/quiz/i_quiz_local_repository.dart';
import '../../data/repository/local/quiz/quiz_local_repository.dart';
import '../../data/repository/remote/child/child_repository.dart';
import '../../data/repository/remote/child/i_child_repository.dart';
import 'admin_controller.dart';

class AdminBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IChildProvider>(
      () => ChildProvider(),
    );
    Get.lazyPut<IChildRepository>(
      () => ChildRepository(
        provider: Get.find(),
      ),
    );

    Get.lazyPut<IQuizLocalProvider>(
      () => QuizLocalProvider(),
    );
    Get.lazyPut<IQuizLocalRepository>(
      () => QuizLocalRepository(
        provider: Get.find(),
      ),
    );

    Get.lazyPut<IUserRegisterProvider>(
      () => UserRegisterProvider(),
    );
    Get.lazyPut<IUserRegisterRepository>(
      () => UserRegisterRepository(
        provider: Get.find(),
      ),
    );

    Get.put(
      AdminController(
        iQuizLocalRepository: Get.find<IQuizLocalRepository>(),
        iChildRepository: Get.find<IChildRepository>(),
        userRegisterRepository: Get.find<IUserRegisterRepository>(),
      ),
    );
  }
}
