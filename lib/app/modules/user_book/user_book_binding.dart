import 'package:get/get.dart';

import '../../data/provider/local/quiz/i_quiz_local_provider.dart';
import '../../data/provider/local/quiz/quiz_local_provider.dart';
import '../../data/provider/remote/register/i_user_register_provider.dart';
import '../../data/provider/remote/register/user_register_provider.dart';
import '../../data/repository/local/quiz/i_quiz_local_repository.dart';
import '../../data/repository/local/quiz/quiz_local_repository.dart';
import '../../data/repository/remote/register/i_user_register_repository.dart.dart';
import '../../data/repository/remote/register/user_register_repository.dart';
import 'user_book_controller.dart';

class UserBookBinding implements Bindings {
  @override
  void dependencies() {
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
      UserBookController(
        iQuizLocalRepository: Get.find<IQuizLocalRepository>(),
        userRegisterRepository: Get.find<IUserRegisterRepository>(),
      ),
    );
  }
}
