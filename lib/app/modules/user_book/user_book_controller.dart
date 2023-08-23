import 'package:app_read/app/data/model/book_model.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:app_read/app/usecases/register/register_usecases.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';

import '../../data/repository/remote/register/i_user_register_repository.dart.dart';

final faker = Faker();

class UserBookController extends GetxController {
  final IUserRegisterRepository userRegisterRepository;
  UserBookController({required this.userRegisterRepository});

  final mockList = List<BookModel>.generate(
    17,
    (index) => BookModel(
      id: 0,
      uuidBook: faker.guid.random.toString(),
      title: faker.lorem.word(),
      level: int.parse(faker.address.buildingNumber()),
      description: faker.lorem
          .sentences(100)
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', ''),
    ),
  );

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
