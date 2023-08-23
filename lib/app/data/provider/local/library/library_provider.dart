import 'package:app_read/app/base/database/local_database.dart';
import 'package:app_read/app/domain/book_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/book_model.dart';
import 'i_library_provider.dart';

class LocalLibraryProvider with LocalDatabase implements ILocalLibraryProvider {
  @override
  Future<List<BookEntity>> getAllBooksFromDB() async {
    final db = await openLocalDatabase();
    final List<Map<String, dynamic>> maps = await db.query('books');
    return List.generate(maps.length, (i) {
      return BookModel(
        id: maps[i]['id'],
        uuidBook: maps[i]['uuidBook'],
        title: maps[i]['title'],
        level: maps[i]['level'],
        description: maps[i]['description'],
      );
    });
  }

  Future<void> insertBook(BookModel book) async {
    final db = await openLocalDatabase();

    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
