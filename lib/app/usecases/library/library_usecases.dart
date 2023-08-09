import '../../data/repository/library/i_library_repository.dart.dart';
import '../../domain/book_entity.dart';

abstract class LibraryUsecases {
  static Future<List<BookEntity>> getAllBooks(
    ILibraryRepository iLibraryRepository,
  ) async {
    return await iLibraryRepository.getAllBooks();
  }
}
