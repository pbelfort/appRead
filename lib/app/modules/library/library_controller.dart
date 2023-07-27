import 'package:app_read/app/data/model/book_model.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';

final faker = Faker();

class LibraryController extends GetxController {
  final mockList = List<BookModel>.generate(
    17,
    (index) => BookModel(
      title: faker.lorem.word(),
      ageBook: int.parse(faker.address.buildingNumber()),
      description: faker.lorem
          .sentences(100)
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', ''),
    ),
  );
  LibraryController();

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
}
