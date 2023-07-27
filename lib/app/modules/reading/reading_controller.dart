import 'package:get/get.dart';

class ReadingController extends GetxController {
  final bookTitle = Get.parameters['book_title'];
  final bookDescription = Get.parameters['book_description'];

  void goToQuizPage() {
    print('Go to quiz page');
  }
}
