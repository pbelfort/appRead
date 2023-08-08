import 'package:app_read/app/routes/app_pages.dart';
import 'package:app_read/app/usecases/library/library_usecases.dart';
import 'package:get/get.dart';

import '../../data/repository/library/i_library_repository.dart.dart';

class LibraryController extends GetxController {
  final ILibraryRepository iLibraryRepository;

  LibraryController({required this.iLibraryRepository});

  @override
  Future<void> onInit() async {
    final bookList = await LibraryUsecases.getAllBooks(iLibraryRepository);
    print(bookList);
    super.onInit();
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
}
