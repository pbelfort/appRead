import '../../../domain/book_entity.dart';
import '../../provider/library/i_library_provider.dart';
import 'i_library_repository.dart.dart';

class LibraryRepository implements ILibraryRepository {
  final ILibraryProvider provider;
  LibraryRepository({required this.provider});

  @override
  Future<List<BookEntity>> getAllBooks() async {
    final response = await provider.getAllBooks();
    return response;
  }
}
