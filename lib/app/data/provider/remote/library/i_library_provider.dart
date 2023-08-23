import '../../../../domain/book_entity.dart';

abstract class ILibraryProvider {
  Future<List<BookEntity>> getAllBooks();
}
