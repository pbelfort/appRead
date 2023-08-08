import '../../data/repository/library/i_library_repository.dart.dart';

abstract class LibraryUsecases {
  static Future<String> getAllBooks(
    ILibraryRepository iLibraryRepository,
  ) async {
    return await iLibraryRepository.getAllBooks();
  }
}
