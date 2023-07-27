import 'package:app_read/app/data/model/book_model.dart';
import 'package:get/get.dart';

class UserBookController extends GetxController {
  UserBookController();
  final mockList = List<BookModel>.generate(
    17,
    (index) => BookModel(
      title: 'title$index',
      ageBook: 'ageBook$index',
      description: 'description$index',
    ),
  );
}
