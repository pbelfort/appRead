import 'dart:convert';

import 'package:app_read/app/domain/book_entity.dart';

// userRegisterModel userRegisterModelFromJson(str) => userRegisterModel.fromJson(str);

String userRegisterModelToJson(BookModel book) => json.encode(
      book.toMap(),
    );

class BookModel extends BookEntity {
  BookModel({
    required super.uuidBook,
    required super.title,
    required super.level,
    required super.description,
    required super.id,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'uuidBook': uuidBook,
        'title': title,
        'level': level,
        'description': description,
      };

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: 0,
      uuidBook: map['id'],
      title: map['title'],
      level: map['level'],
      description: map['description'],
    );
  }
}
