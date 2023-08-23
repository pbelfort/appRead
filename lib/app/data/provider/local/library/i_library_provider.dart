import '../../../../domain/book_entity.dart';

abstract class ILocalLibraryProvider {
  Future<List<BookEntity>> getAllBooksFromDB();
}
