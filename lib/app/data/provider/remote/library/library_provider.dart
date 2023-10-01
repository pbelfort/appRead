import 'dart:convert';

import 'package:app_read/app/data/model/book_model.dart';
import 'package:app_read/app/domain/book_entity.dart';

import '../../../../base/enviroment.dart';
import 'i_library_provider.dart';
import 'package:http/http.dart' as http;

class LibraryProvider implements ILibraryProvider {
  @override
  Future<List<BookEntity>> getAllBooks() async {
    List<BookEntity> books = <BookEntity>[];
    try {
      final response = await http.get(
        Uri.parse('${AppEnviroment.baseUrl}/book/getAllBooks'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body)['bookList'] as List;
        for (var book in decodedResponse) {
          books.add(BookModel.fromMap(book));
        }
      }
      return books;
    } catch (e) {
      rethrow;
    }
  }
}
