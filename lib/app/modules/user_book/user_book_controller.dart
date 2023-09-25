import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/data/provider/shared/custom_shared_preferences.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:app_read/app/usecases/register/register_usecases.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';

import '../../data/repository/local/quiz/i_quiz_local_repository.dart';
import '../../data/repository/remote/register/i_user_register_repository.dart.dart';
import '../../domain/quiz_entity_db.dart';

final faker = Faker();

class UserBookController extends IGlobalController {
  final IUserRegisterRepository userRegisterRepository;
  final IQuizLocalRepository iQuizLocalRepository;
  UserBookController({
    required this.userRegisterRepository,
    required this.iQuizLocalRepository,
  });

  late List readBookList = <QuizEntityDB>[];

  String? score = '';

  @override
  onInit() async {
    showLoading.value = true;
    readBookList = await iQuizLocalRepository.getAllQuizessFromDB();
    score = await CustomSharedPreferences.getScoreUser;
    showLoading.value = false;

    super.onInit();
  }

  goToLibraryPage() {
    Get.toNamed(Routes.LIBRARY);
  }

  Future<void> goToReadingPage({
    required String title,
    required String description,
  }) async {
    await Get.toNamed(
      Routes.READING_BOOK,
      parameters: {
        'book_title': title,
        'book_description': description,
      },
    );
  }

  Future<void> logout() async {
    final logout = await RegisterUsecases.signOut(
      userRegisterRepository: userRegisterRepository,
    );
    if (logout == 200) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
