import 'dart:convert';

import 'package:app_read/app/domain/book_entity.dart';

// userRegisterModel userRegisterModelFromJson(str) => userRegisterModel.fromJson(str);

String userRegisterModelToJson(BookModel book) => json.encode(
      book.toJson(),
    );

class BookModel extends BookEntity {
  BookModel({
    required super.uuidBook,
    required super.title,
    required super.level,
    required super.description,
  });

  Map<String, dynamic> toJson() => {
        'uuidBook': uuidBook,
        'title': title,
        'ageBook': level,
        'description': description,
      };

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      uuidBook: map['id'],
      title: map['title'],
      level: map['level'],
      description: map['description'],
    );
  }
}
