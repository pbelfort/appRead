import 'package:app_read/app/data/model/book_model.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';

final faker = Faker();

class UserBookController extends GetxController {
  UserBookController();

  final mockList = List<BookModel>.generate(
    17,
    (index) => BookModel(
      title: faker.lorem.word(),
      ageBook: int.parse(faker.address.buildingNumber()),
      description: faker.lorem.sentence(),
    ),
  );

  goToLibraryPage() {
    Get.toNamed(Routes.LIBRARY);
  }
}
