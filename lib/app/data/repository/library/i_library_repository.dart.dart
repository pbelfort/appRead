import '../../../domain/book_entity.dart';

abstract class ILibraryRepository {
  Future<List<BookEntity>> getAllBooks();
}
