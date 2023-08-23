import 'package:app_read/app/data/provider/local/library/i_library_provider.dart';
import '../../../../domain/book_entity.dart';
import 'i_library_repository.dart.dart';

class LocalLibraryRepository implements ILocalLibraryRepository {
  final ILocalLibraryProvider provider;
  LocalLibraryRepository({required this.provider});

  @override
  Future<List<BookEntity>> getAllBooksFromDB() async {
    final response = await provider.getAllBooksFromDB();
    return response;
  }
}
