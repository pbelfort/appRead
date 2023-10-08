import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/data/provider/shared/custom_shared_preferences.dart';
import 'package:app_read/app/domain/child_entity.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:app_read/app/usecases/register/register_usecases.dart';
import 'package:get/get.dart';

import '../../data/repository/local/quiz/i_quiz_local_repository.dart';
import '../../data/repository/remote/register/i_user_register_repository.dart.dart';
import '../../domain/quiz_entity_db.dart';

class UserBookController extends IGlobalController {
  final IUserRegisterRepository userRegisterRepository;
  final IQuizLocalRepository iQuizLocalRepository;
  UserBookController({
    required this.userRegisterRepository,
    required this.iQuizLocalRepository,
  });

  late List<QuizEntityDB> readBookList = <QuizEntityDB>[];

  String? score = '';

  ChildEntity get child => Get.arguments['child'];

  @override
  onInit() async {
    showLoading.value = true;
    readBookList = await iQuizLocalRepository.getAllQuizessFromDB();
    readBookList.removeWhere((element) => element.uuidChild != child.uuidChild);
    score = await CustomSharedPreferences.getScoreUser(child.uuidChild);
    showLoading.value = false;
    super.onInit();
  }

  goToLibraryPage() {
    Get.toNamed(
      Routes.LIBRARY,
      arguments: {
        'child': child,
      },
    );
  }

  Future<void> logout() async {
    final logout = await RegisterUsecases.signOut(
      userRegisterRepository: userRegisterRepository,
    );
    if (logout == 200) {
      CustomSharedPreferences.removeTokenInSharedPreferences();
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
