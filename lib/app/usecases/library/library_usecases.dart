import '../../data/repository/remote/library/i_library_repository.dart.dart';
import '../../domain/book_entity.dart';

abstract class LibraryUsecases {
  static Future<List<BookEntity>> getAllBooks(
    ILibraryRepository iLibraryRepository,
  ) async {
    return await iLibraryRepository.getAllBooks();
  }
}
