import 'package:app_read/app/base/custom_controller.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:app_read/app/usecases/library/library_usecases.dart';
import 'package:get/get.dart';
import '../../data/repository/library/i_library_repository.dart.dart';
import '../../domain/book_entity.dart';

class LibraryController extends ICustomController {
  final ILibraryRepository iLibraryRepository;

  LibraryController({required this.iLibraryRepository});

  List<BookEntity> bookList = [];

  @override
  Future<void> onInit() async {
    await _getBookList();

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

  Future<void> _getBookList() async {
    showLoading.value = true;
    bookList = await LibraryUsecases.getAllBooks(iLibraryRepository);
    showLoading.value = false;
  }
}
