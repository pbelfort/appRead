import '../../../../domain/book_entity.dart';

abstract class ILocalLibraryRepository {
  Future<List<BookEntity>> getAllBooksFromDB();
}
