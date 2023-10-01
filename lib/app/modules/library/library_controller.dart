import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:app_read/app/usecases/library/library_usecases.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../data/repository/local/quiz/i_quiz_local_repository.dart';
import '../../data/repository/remote/library/i_library_repository.dart.dart';
import '../../domain/book_entity.dart';
import '../../domain/quiz_entity_db.dart';
import '../../usecases/quiz/quiz_usecases.dart';

class LibraryController extends IGlobalController {
  final ILibraryRepository iLibraryRepository;
  final IQuizLocalRepository iQuizLocalRepository;

  String? get uuidChild => Get.parameters['uuid_child'];

  LibraryController({
    required this.iLibraryRepository,
    required this.iQuizLocalRepository,
  });

  List<BookEntity> bookList = <BookEntity>[];
  List<BookEntity> searchBookList = <BookEntity>[];

  List<QuizEntityDB> quizes = <QuizEntityDB>[];

  final searchEditingController = TextEditingController();

  @override
  Future<void> onInit() async {
    await _getBookList();
    quizes = await QuizUsecases.getQuizesFromDB(iQuizLocalRepository);

    super.onInit();
  }

  Future<void> goToReadingPage({
    required BookEntity book,
  }) async {
    await Get.toNamed(
      Routes.READING_BOOK,
      arguments: {
        'book': book,
      },
      parameters: {
        'uuid_child': uuidChild ?? '',
      },
    );
  }

  Future<void> _getBookList() async {
    showLoading.value = true;
    bookList = await LibraryUsecases.getAllBooks(iLibraryRepository);
    showLoading.value = false;
  }

  void filterSearchResults(String query) {
    showLoading.value = true;
    searchBookList = bookList
        .where(
          (item) => item.title!.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    showLoading.value = false;
  }
}
